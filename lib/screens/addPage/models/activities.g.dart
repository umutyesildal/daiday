// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivitiesAdapter extends TypeAdapter<Activities> {
  @override
  final int typeId = 1;

  @override
  Activities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Activities(
      activity: fields[0] as String,
      emoji: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Activities obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.activity)
      ..writeByte(1)
      ..write(obj.emoji);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
