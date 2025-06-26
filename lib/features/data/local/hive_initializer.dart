import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_map/features/data/local/mood_type_adapter.dart';
import 'package:mood_map/features/data/models/mood_entry.dart';

class HiveInitializer {
  static const String moodBoxName = 'mood_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    // سجل كل Adapter إذا لم يكن مسجلاً
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(MoodTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MoodEntryAdapter());
    }

    await Hive.openBox<MoodEntry>(moodBoxName);
  }
}
