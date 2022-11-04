import 'package:blocproject/domin/failure/failure.dart';
import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/domin/repositories/products_repo.dart';
import 'package:dartz/dartz.dart';

import '../data_source/products_data_source.dart';

class ProductRepoImpl implements ProductsRepo {
  final ProductsDataSource productsDataSource = ProductDataSourceImpl();
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final result = await productsDataSource.getProductsFromDataSource();
      return right(result);
      
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
