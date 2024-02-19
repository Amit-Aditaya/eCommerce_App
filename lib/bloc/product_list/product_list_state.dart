part of 'product_list_bloc.dart';

sealed class ProductListState {
  const ProductListState();
}

final class ProductListLoadingState extends ProductListState {}

final class ProductListLoadedState extends ProductListState {
  final List<ProductModel> products;

  const ProductListLoadedState({required this.products});
}

final class ProductListErrorState extends ProductListState {
  final String message;

  const ProductListErrorState({required this.message});
}
