import 'package:bringr/core/error/failure.dart';
import 'package:bringr/core/usecase/usecase.dart';
import 'package:bringr/feature/products/domain/entities/products.dart';
import 'package:bringr/feature/products/domain/repository/products_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProducts implements Usecase<List<Products>, NoParams> {
  final ProductsRepository productsRepository;

  const GetProducts(this.productsRepository);
  @override
  Future<Either<Failure, List<Products>>> call(NoParams params) async {
    return await productsRepository.getProducts();
  }
}
