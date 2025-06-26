import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart' show Box;
import 'package:collection/collection.dart';
import 'package:mood_map/core/constants/colors.dart';
import 'package:mood_map/core/enums/enum.dart';
import 'package:mood_map/features/data/models/mood_entry.dart';

class MoodProvider extends ChangeNotifier {
  final Box<MoodEntry> _moodBox;
  MoodType? selectedMood;
  final TextEditingController noteController = TextEditingController();

  MoodProvider(this._moodBox) {
    _loadMoods();
  }

  final List<MoodEntry> _entries = [];

  List<MoodEntry> get entries => List.unmodifiable(_entries);

  void _loadMoods() {
    _entries.clear();
    _entries.addAll(_moodBox.values);
    notifyListeners();
  }

  Future<void> addMood(MoodEntry entry) async {
    final dateOnly = DateTime(entry.date.year, entry.date.month, entry.date.day);
    final entryWithDateOnly = MoodEntry(date: dateOnly, mood: entry.mood, note: entry.note);
    await _moodBox.put(dateOnly.toIso8601String(), entryWithDateOnly);
    _loadMoods();
  }

  MoodEntry? getMoodByDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return _moodBox.get(dateOnly.toIso8601String());
  }

  Future<void> deleteMood(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    await _moodBox.delete(dateOnly.toIso8601String());
    _loadMoods();
  }

  Future<void> updateMood(MoodEntry updatedEntry) async {
    final dateOnly = DateTime(updatedEntry.date.year, updatedEntry.date.month, updatedEntry.date.day);
    final entryWithDateOnly = MoodEntry(date: dateOnly, mood: updatedEntry.mood, note: updatedEntry.note);
    await _moodBox.put(dateOnly.toIso8601String(), entryWithDateOnly);
    _loadMoods();
  }

  void setMood(MoodType mood) {
    selectedMood = mood;
    notifyListeners();
  }

  Future<MoodSaveResult> saveMood() async {
    if (selectedMood == null) return MoodSaveResult.noMood;
    if (noteController.text.trim().isEmpty) return MoodSaveResult.emptyNote;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    try {
      final moodEntry = MoodEntry(mood: selectedMood!, note: noteController.text.trim(), date: today);
      await _moodBox.put(today.toIso8601String(), moodEntry);
      selectedMood = null;
      noteController.clear();
      _loadMoods();
      return MoodSaveResult.success;
    } catch (e) {
      return MoodSaveResult.error;
    }
  }

  // تعيد المزاج (MoodType) ليوم معين إذا وجد
  MoodType? getMoodTypeForDay(int day, int month, int year) {
    final entry = _entries.firstWhereOrNull((e) => e.date.year == year && e.date.month == month && e.date.day == day);
    return entry?.mood;
  }

  // تعيد اللون المناسب حسب المزاج
  // Color getMoodColorForDay(int day, int month, int year) {
  //   final mood = getMoodTypeForDay(day, month, year);
  //   switch (mood) {
  //     case MoodType.happy:
  //       return MoodColors.happyNormal;
  //     case MoodType.good:
  //       return MoodColors.goodNormal;
  //     case MoodType.okay:
  //       return MoodColors.okNormal;
  //     case MoodType.bad:
  //       return MoodColors.badNormal;
  //     case MoodType.awfull:
  //       return MoodColors.awfulNormal;
  //     default:
  //       return Colors.transparent;
  //   }
  // }

  Color getMoodColorForDay(bool isDark, int day, int month, int year) {
    final mood = getMoodTypeForDay(day, month, year);

    switch (mood) {
      case MoodType.happy:
        return isDark ? MoodColors.happyDark : MoodColors.happyNormal;
      case MoodType.good:
        return isDark ? MoodColors.goodDark : MoodColors.goodNormal;
      case MoodType.okay:
        return isDark ? MoodColors.okDark : MoodColors.okNormal;
      case MoodType.bad:
        return isDark ? MoodColors.badDark : MoodColors.badNormal;
      case MoodType.awfull:
        return isDark ? MoodColors.awfulDark : MoodColors.awfulNormal;
      default:
        return Colors.transparent;
    }
  }

  // دالة لإحصاء المزاجات في شهر معيّن
  Map<MoodType, int> getMoodCountForMonth(int month, int year, {MoodType? filter}) {
    final counts = <MoodType, int>{};
    for (final entry in _entries) {
      if (entry.date.month == month && entry.date.year == year) {
        if (filter == null || entry.mood == filter) {
          counts.update(entry.mood, (v) => v + 1, ifAbsent: () => 1);
        }
      }
    }
    return counts;
  }

  // تحليل مزاج أسبوعي
  Map<MoodType, int> getMoodCountForWeek(DateTime start, DateTime end, {MoodType? filter}) {
    final DateTime startDay = DateTime(start.year, start.month, start.day);
    final DateTime endDay = DateTime(end.year, end.month, end.day);

    final counts = <MoodType, int>{};
    for (final entry in _entries) {
      final entryDay = DateTime(entry.date.year, entry.date.month, entry.date.day);
      if (!entryDay.isBefore(startDay) && !entryDay.isAfter(endDay)) {
        if (filter == null || entry.mood == filter) {
          counts.update(entry.mood, (v) => v + 1, ifAbsent: () => 1);
        }
      }
    }
    return counts;
  }

  //-**********************test******************************
  Future<void> seedMoodEntriesForCurrentMonth() async {
    final now = DateTime.now();
    final int month = now.month;
    final int year = now.year;

    // الأيام التي تريد تخزينها
    final List<int> days = [10, 15, 22, 5, 17, 27];
    final moods = MoodType.values;
    final random = Random();

    for (final day in days) {
      final mood = moods[random.nextInt(moods.length)];
      final entry = MoodEntry(date: DateTime(year, month, day), mood: mood, note: "Test mood for $day");
      // استخدم put ليكون المفتاح هو اليوم (حتى لا تكرر نفس اليوم)
      await _moodBox.put(entry.date.toIso8601String(), entry);
    }
    _loadMoods(); // حتى تحدث الواجهة بعد الإضافة
    notifyListeners();
  }
}
