// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalEntryAdapter extends TypeAdapter<JournalEntry> {
  @override
  final int typeId = 0;

  @override
  JournalEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalEntry(
      id: fields[0] as String?,
      createdAt: fields[1] as DateTime?,
      observation: fields[2] as String,
      feelings: (fields[3] as List).cast<String>(),
      need: fields[4] as String,
      demand: fields[5] as String,
      selfReflection: fields.containsKey(6) ? fields[6] as String? : null,
      otherReflection: fields.containsKey(7) ? fields[7] as String? : null,
      actions:
          (fields[8] as List?)?.map((dynamic e) => e as String).toList() ?? const [],
    );
  }

  @override
  void write(BinaryWriter writer, JournalEntry obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.observation)
      ..writeByte(3)
      ..write(obj.feelings)
      ..writeByte(4)
      ..write(obj.need)
      ..writeByte(5)
      ..write(obj.demand)
      ..writeByte(6)
      ..write(obj.selfReflection)
      ..writeByte(7)
      ..write(obj.otherReflection)
      ..writeByte(8)
      ..write(obj.actions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
