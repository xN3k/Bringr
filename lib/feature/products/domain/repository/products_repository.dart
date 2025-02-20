import 'package:bringr/core/error/failure.dart';
import 'package:bringr/feature/products/domain/entities/products.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ProductsRepository {
  Future<Either<Failure, List<Products>>> getProducts();
}
