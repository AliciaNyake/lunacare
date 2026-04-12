// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CycleModelAdapter extends TypeAdapter<CycleModel> {
  @override
  final int typeId = 0;

  @override
  CycleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CycleModel(
      date: fields[0] as String,
      flux: fields[1] as String,
      humeur: fields[2] as String,
      temperature: fields[3] as double,
      poids: fields[4] as double,
      hydratation: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CycleModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.flux)
      ..writeByte(2)
      ..write(obj.humeur)
      ..writeByte(3)
      ..write(obj.temperature)
      ..writeByte(4)
      ..write(obj.poids)
      ..writeByte(5)
      ..write(obj.hydratation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CycleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
