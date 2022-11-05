import 'package:bloc/bloc.dart';
import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/domin/usecases/get_data_usecases.dart';
import 'package:equatable/equatable.dart';

part 'mainscreen_event.dart';
part 'mainscreen_state.dart';

class MainscreenBloc extends Bloc<MainscreenEvent, MainscreenState> {
  final ProductUseCases productUseCases;
  MainscreenBloc({required this.productUseCases}) : super(MainscreenInitial()) {
    on<GetDataRequest>((event, emit) async {
      emit(MainScreenLoader());
      final failureOrProducts = await productUseCases.getProducts();
      failureOrProducts.fold(
          (l) => emit(MainScreenError(massage: 'somthing wrong')),
          (r) => emit(MainScreenLoaded(products: r)));
    });
  }
}
