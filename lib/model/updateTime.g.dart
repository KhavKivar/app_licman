// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateTime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpdateTimeAdapter extends TypeAdapter<UpdateTime> {
  @override
  final int typeId = 3;

  @override
  UpdateTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpdateTime(
      updateTime: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UpdateTime obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.updateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
