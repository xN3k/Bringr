import 'package:bringr/core/error/exception.dart';
import 'package:bringr/feature/products/data/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final productCollection = FirebaseFirestore.instance.collection('products');

  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      return productCollection.get().then(
        (value) =>
            value.docs
                .map((e) => ProductsModel.fromDocument(e.data()))
                .toList(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
