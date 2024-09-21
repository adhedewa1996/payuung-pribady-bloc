// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arithmetic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArithmeticModelAdapter extends TypeAdapter<ArithmeticModel> {
  @override
  final int typeId = 0;

  @override
  ArithmeticModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArithmeticModel(
      imagePath: fields[0] as String?,
      uint8List: fields[1] as String?,
      inputFromMlKit: fields[2] as String?,
      result: fields[3] as String?,
      from: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ArithmeticModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.uint8List)
      ..writeByte(2)
      ..write(obj.inputFromMlKit)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.from);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArithmeticModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
