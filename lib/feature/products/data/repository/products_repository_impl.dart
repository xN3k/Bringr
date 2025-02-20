import 'package:bringr/core/error/exception.dart';
import 'package:bringr/core/error/failure.dart';
import 'package:bringr/feature/products/data/datasource/products_remote_data_source.dart';
import 'package:bringr/feature/products/domain/entities/products.dart';
import 'package:bringr/feature/products/domain/repository/products_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  const ProductsRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<Products>>> getProducts() async {
    try {
      final product = await remoteDataSource.getProducts();

      return right(product);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
