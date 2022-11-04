part of 'mainscreen_bloc.dart';

abstract class MainscreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainscreenInitial extends MainscreenState {
}

class MainScreenLoader extends MainscreenState {
  @override
  List<Object> get props => [];
}

class MainScreenLoaded extends MainscreenState {
  final List<ProductEntity> products;
  MainScreenLoaded({ required this.products});
  @override
  List<Object> get props => [products];
}

class MainScreenError extends MainscreenState {
  final String massage;
  MainScreenError({required this.massage});

}
