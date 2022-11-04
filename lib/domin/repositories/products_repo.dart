import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/domin/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
