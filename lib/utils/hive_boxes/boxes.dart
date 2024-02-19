import 'package:hive/hive.dart';
import 'package:tr_app/data/model/cart/cartmodel.dart';

class Boxes {
  static Box<CartModel> getCart() => Hive.box<CartModel>('cartBox');
}
