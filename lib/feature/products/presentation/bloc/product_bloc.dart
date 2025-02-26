import 'package:bringr/core/usecase/usecase.dart';
import 'package:bringr/feature/products/domain/entities/products.dart';
import 'package:bringr/feature/products/domain/usecase/get_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts;
  ProductBloc({required GetProducts getProducts})
    : _getProducts = getProducts,
      super(ProductInitial()) {
    on<ProductEvent>((_, emit) => ProductInitial());
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    final response = await _getProducts(NoParams());

    response.fold((l) {
      emit(ProductFailure(l.message));
      print(l.message);
    }, (r) => emit(ProductSuccess(r)));
  }
}
