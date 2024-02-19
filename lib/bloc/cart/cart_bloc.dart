import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tr_app/data/model/cart/cartmodel.dart';
import 'package:tr_app/data/model/cart_product/cart_product_model.dart';
import 'package:tr_app/utils/hive_boxes/boxes.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<InitialCartEvent>(_cartInitial);
    on<AddToCartEvent>(_addToCart);
    on<RemoveFromCartEvent>(_removeFromCart);
  }

  CartModel cart = CartModel(cartProducts: []);

  FutureOr<void> _cartInitial(InitialCartEvent event, Emitter<CartState> emit) {
    //check local storage
    //add to cart

    final box = Boxes.getCart();
    if (box.isNotEmpty) {
      cart = box.values.first;
    }

    emit(CartLoadedState(cart));
  }

  Future<void> _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    bool productAlreadyExists = false;

    for (int i = 0; i < cart.cartProducts.length; i++) {
      if (cart.cartProducts[i].product.id == event.cartProduct.product.id) {
        cart.cartProducts[i].qty++;
        productAlreadyExists = true;
        break;
      }
    }

    if (!productAlreadyExists) {
      cart.cartProducts.add(event.cartProduct);
    }

    emit(CartLoadedState(cart));
  }

  FutureOr<void> _removeFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    for (int i = 0; i < cart.cartProducts.length; i++) {
      if (cart.cartProducts[i].product.id == event.cartProduct.product.id) {
        cart.cartProducts[i].qty--;

        if (cart.cartProducts[i].qty == 0) {
          cart.cartProducts.removeAt(i);
        }
        break;
      }
    }

    emit(CartLoadedState(cart));
  }
}
