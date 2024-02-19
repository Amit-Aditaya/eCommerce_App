import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tr_app/data/model/product/product_model.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId: 1)
class CartProduct extends HiveObject {
  @HiveField(0)
  ProductModel product;

  @HiveField(1)
  int qty;

  CartProduct(this.product, this.qty);
}
