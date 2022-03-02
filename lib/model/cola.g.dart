// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cola.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColaAdapter extends TypeAdapter<Cola> {
  @override
  final int typeId = 4;

  @override
  Cola read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cola(
      fields[0] as Inspeccion?,
      fields[1] as String,
      fields[2] as String,
      fields[3] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Cola obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.acta)
      ..writeByte(1)
      ..write(obj.ts)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
