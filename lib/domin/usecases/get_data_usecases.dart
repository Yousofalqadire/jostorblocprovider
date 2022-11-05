import 'package:blocproject/data/repositories/product_repo_impl.dart';
import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/domin/failure/failure.dart';
import 'package:blocproject/domin/repositories/products_repo.dart';
import 'package:dartz/dartz.dart';

class ProductUseCases {
  final ProductsRepo productRepoImpl;
  ProductUseCases({required this.productRepoImpl});
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {

    await Future.delayed(const Duration(seconds: 2), () {});
    return productRepoImpl.getProducts();
  }
}
