import 'package:flutter/material.dart';

final lightTheme = ThemeData.light();

final dartTheme = ThemeData.dark();

class ThemesNotifier with ChangeNotifier {
  static ThemeData _currentTheme = lightTheme;

  void setCurrentTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }

  get currentTheme => _currentTheme;
}
