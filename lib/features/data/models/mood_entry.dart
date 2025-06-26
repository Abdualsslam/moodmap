import 'package:hive/hive.dart';
import 'package:mood_map/core/enums/enum.dart'; // Import the correct MoodType

part 'mood_entry.g.dart';

@HiveType(typeId: 1)
class MoodEntry extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final MoodType mood;

  @HiveField(2)
  final String? note;

  MoodEntry({required this.date, required this.mood, this.note});
}
