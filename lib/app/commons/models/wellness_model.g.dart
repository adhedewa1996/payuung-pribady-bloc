// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WellnewssItemAdapter extends TypeAdapter<WellnewssItem> {
  @override
  final int typeId = 4;

  @override
  WellnewssItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WellnewssItem(
      image: fields[0] as String,
      title: fields[1] as String,
      price: fields[2] as double,
      finalPrice: fields[3] as double,
      discount: fields[4] as double,
      isDiscountApplyed: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WellnewssItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.finalPrice)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.isDiscountApplyed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WellnewssItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
