

import 'package:blocproject/app/screens/main_screen/bloc/mainscreen_bloc.dart';
import 'package:blocproject/data/data_source/products_data_source.dart';
import 'package:blocproject/data/repositories/product_repo_impl.dart';
import 'package:blocproject/domin/repositories/products_repo.dart';
import 'package:blocproject/domin/usecases/get_data_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
final  sl = GetIt.I; // service locator

Future<void> init()async {
  //application layer
  sl.registerFactory(() => MainscreenBloc(productUseCases: sl()));
  // domin layer
  sl.registerFactory(() => ProductUseCases(productRepoImpl: sl()));
  // data layer
  sl.registerFactory<ProductsRepo>(() => ProductRepoImpl(productsDataSource: sl()));
  sl.registerFactory<ProductsDataSource>(() => ProductDataSourceImpl(client: sl()));
  // extern
  sl.registerFactory(() => http.Client());
}
