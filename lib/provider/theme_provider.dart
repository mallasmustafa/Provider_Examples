import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
