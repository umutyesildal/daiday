// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notesAndPhotos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesAndPhotosAdapter extends TypeAdapter<NotesAndPhotos> {
  @override
  final int typeId = 3;

  @override
  NotesAndPhotos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesAndPhotos(
      notes: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotesAndPhotos obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesAndPhotosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
