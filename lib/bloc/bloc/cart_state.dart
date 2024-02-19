part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitialState extends CartState {}

final class CartLoadedState extends CartState {
  final CartModel cart;

  CartLoadedState(this.cart);
}

final class CartErrorState extends CartState {}
