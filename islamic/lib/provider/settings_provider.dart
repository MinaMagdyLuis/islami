import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  void changeTheme(ThemeMode mode) {
    if (mode == currentTheme) return;
    currentTheme = mode;
    notifyListeners();
  }

  String getBackgroundImage() {
    return currentTheme == ThemeMode.dark
        ? 'assets/images/main_background_dark.jpg'
        : 'assets/images/main_background.png';
  }

  bool isDarkEnabled() {
    return currentTheme == ThemeMode.dark;
  }

  void changeLanguage(String language) {
    if (currentLanguage == language) return;
    currentLanguage = language;
    notifyListeners();
  }

  bool isEnglishEnabled() {
    return currentLanguage == 'en';
  }
}
