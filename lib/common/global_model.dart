import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GlobalModel {
  bool? isDarkMode;
}

class DarkMode with ChangeNotifier {
  bool? _isDarkMode;

  bool? get value => _isDarkMode;

  void setDarkMode(bool darkMode) {
    _isDarkMode = darkMode;
    notifyListeners();
  }
}


