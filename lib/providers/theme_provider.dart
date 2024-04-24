//File: lib/providers/theme_provider.dart
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false; // Initial theme is set to Light mode.

  // Getter to check current theme mode.
  bool get isDarkMode => _isDarkMode;

  // Method to toggle the theme between dark and light.
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notify all listening widgets of the change.
  }
}
