import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tr_app/data/model/product_model.dart';
import 'package:tr_app/data/repository/product_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListLoadingState()) {
    on<GetProductListEvent>(_getProductList);
  }

  FutureOr<void> _getProductList(
      GetProductListEvent event, Emitter<ProductListState> emit) async {
    ProductRepository productRepository = ProductRepository();
    try {
      List<ProductModel> products = await productRepository.getProductLst();
      emit(ProductListLoadedState(products: products));
    } on Exception catch (e) {
      emit(ProductListErrorState(message: e.toString()));
    }
  }
}
