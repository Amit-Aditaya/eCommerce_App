// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      slug: fields[1] as String,
      url: fields[2] as String,
      title: fields[3] as String,
      content: fields[4] as String,
      image: fields[5] as String,
      thumbnail: fields[6] as String,
      status: fields[7] as String,
      category: fields[8] as String,
      publishedAt: fields[9] as String,
      updatedAt: fields[10] as String,
      userId: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.thumbnail)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.publishedAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
