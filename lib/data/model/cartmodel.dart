import 'package:hive/hive.dart';
import 'package:tr_app/data/model/cart_product_model.dart';

part 'cartmodel.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  List<CartProduct> cartProducts;

  CartModel({required this.cartProducts});
}
