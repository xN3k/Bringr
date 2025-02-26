import 'package:bringr/core/error/exception.dart';
import 'package:bringr/feature/products/data/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  // final productCollection = FirebaseFirestore.instance.collection('products');
  final FirebaseFirestore firestore;
  const ProductsRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      final product = await firestore
          .collection('products')
          .get()
          .then(
            (value) =>
                value.docs
                    .map((e) => ProductsModel.fromDocument(e.data()))
                    .toList(),
          );

      return product;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
