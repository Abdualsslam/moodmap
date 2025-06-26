import 'package:hive/hive.dart';
import 'package:mood_map/core/enums/enum.dart';

// إذا enum اسمه MoodType
class MoodTypeAdapter extends TypeAdapter<MoodType> {
  @override
  final int typeId = 0;

  @override
  MoodType read(BinaryReader reader) {
    return MoodType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, MoodType obj) {
    writer.writeByte(obj.index);
  }
}
