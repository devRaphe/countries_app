import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// This class would be responsible for managing the theme state of the app.
class ThemeService with ReactiveServiceMixin {
  /// state of the theme mode.
  ThemeMode _themeMode = ThemeMode.system;

  /// getter for the theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Setter for theme mode.
  void setThemeMode({required bool isDarkMode}) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
