// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      cartProducts: (fields[0] as List).cast<CartProduct>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cartProducts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
