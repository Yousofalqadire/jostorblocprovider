import 'package:blocproject/data/repositories/product_repo_impl.dart';
import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/domin/failure/failure.dart';
import 'package:dartz/dartz.dart';

class ProductUseCases {
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    final ProductRepoImpl productRepoImpl = ProductRepoImpl();
    await Future.delayed(const Duration(seconds: 2), () {});
    return productRepoImpl.getProducts();
  }
}
