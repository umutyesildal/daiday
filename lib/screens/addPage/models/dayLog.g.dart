// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayLog.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayLogAdapter extends TypeAdapter<DayLog> {
  @override
  final int typeId = 0;

  @override
  DayLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayLog(
      mood: fields[0] as Mood,
      date: fields[1] as DateTime,
      activities: (fields[2] as List).cast<Activities>(),
      notesAndPhotos: fields[3] as NotesAndPhotos,
    );
  }

  @override
  void write(BinaryWriter writer, DayLog obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mood)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.activities)
      ..writeByte(3)
      ..write(obj.notesAndPhotos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
