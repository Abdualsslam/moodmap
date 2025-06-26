import 'package:hive/hive.dart';

@HiveType(typeId: 0) // Assign a unique typeId for MoodType
enum MoodType {
  @HiveField(0)
  happy,
  @HiveField(1)
  good,
  @HiveField(2)
  okay,
  @HiveField(3)
  bad,
  @HiveField(4)
  awfull,
}

enum MoodSaveResult { success, noMood, emptyNote, error }

extension MoodTypeExtension on MoodType {
  String get assetPath => 'assets/emojis/$name.gif';
}
