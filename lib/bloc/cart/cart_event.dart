part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class InitialCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartProduct cartProduct;
  AddToCartEvent(this.cartProduct);
}

class RemoveFromCartEvent extends CartEvent {
  final CartProduct cartProduct;
  RemoveFromCartEvent(this.cartProduct);
}
