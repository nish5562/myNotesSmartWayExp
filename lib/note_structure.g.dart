// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_structure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteStructureAdapter extends TypeAdapter<NoteStructure> {
  @override
  final int typeId = 1;

  @override
  NoteStructure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteStructure(
      heading: fields[0] as String,
      note: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteStructure obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.heading)
      ..writeByte(1)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteStructureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
