import 'package:blocproject/app/screens/general/theme_service.dart';
import 'package:blocproject/app/screens/main_screen/bloc/mainscreen_bloc.dart';
import 'package:blocproject/domin/entities/product_entity.dart';
import 'package:blocproject/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainScreenArapper extends StatelessWidget {
  const MainScreenArapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainscreenBloc(),
      child: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('main screen'), actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              })
        ]),
        body: BlocBuilder<MainscreenBloc, MainscreenState>(
          builder: (context, state) {
            if (state is MainscreenInitial) {
              return Center(
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {
                      Provider.of<MainscreenBloc>(context, listen: false)
                          .add(GetDataRequest());
                    },
                    child: Text('get the data')),
              );
            } else if (state is MainScreenLoader) {
              return Center(
                child: CircularProgressIndicator(
                  color: appTheme.primaryColor,
                ),
              );
            } else if (state is MainScreenLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Material(
                      color: appTheme.colorScheme.onPrimary,
                      elevation: 15,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(25),
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                child: Text('${state.products[index].id}'),
                              ),
                              Image.network(
                                '${state.products[index].photos![index].url}',
                                width: 100,
                                height: 100,
                              ),
                            ]),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text('nothing '),
            );
          },
        ));
  }
}
