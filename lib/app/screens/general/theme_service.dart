import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkModeOn = false;
  toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }
}
