// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daylog_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DaylogHiveEntityAdapter extends TypeAdapter<DaylogHiveEntity> {
  @override
  final int typeId = 1;

  @override
  DaylogHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DaylogHiveEntity(
      mood: fields[0] as String,
      date: fields[1] as String,
      activities: (fields[2] as List).cast<Activities>(),
      notes: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DaylogHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mood)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.activities)
      ..writeByte(3)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DaylogHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
