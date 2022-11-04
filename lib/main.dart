import 'package:blocproject/app/screens/general/theme_service.dart';
import 'package:blocproject/app/screens/main_screen/main_screen.dart';
import 'package:blocproject/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
     return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
       darkTheme: AppTheme.darkTheme,
       themeMode: themeService.isDarkModeOn? ThemeMode.dark:ThemeMode.light ,
      home:const MainScreenArapper(),
    );
    });
    
  }
}





  


 