// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovimientoAdapter extends TypeAdapter<Movimiento> {
  @override
  final int typeId = 5;

  @override
  Movimiento read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movimiento(
      idMovimiento: fields[0] as int,
      transporte: fields[1] as String,
      fechaRetiro: fields[2] as DateTime?,
      fechaMov: fields[3] as DateTime,
      idInspeccion: fields[4] as int,
      rut: fields[5] as String,
      idGuiaDespacho: fields[6] as int,
      urlGuiaDespacho: fields[7] as String,
      cambio: fields[8] as int?,
      tipo: fields[9] as String,
      observaciones: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Movimiento obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.idMovimiento)
      ..writeByte(1)
      ..write(obj.transporte)
      ..writeByte(2)
      ..write(obj.fechaRetiro)
      ..writeByte(3)
      ..write(obj.fechaMov)
      ..writeByte(4)
      ..write(obj.idInspeccion)
      ..writeByte(5)
      ..write(obj.rut)
      ..writeByte(6)
      ..write(obj.idGuiaDespacho)
      ..writeByte(7)
      ..write(obj.urlGuiaDespacho)
      ..writeByte(8)
      ..write(obj.cambio)
      ..writeByte(9)
      ..write(obj.tipo)
      ..writeByte(10)
      ..write(obj.observaciones);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovimientoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
