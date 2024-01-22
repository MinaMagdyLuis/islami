import 'package:flutter/material.dart';
import 'package:islamic/data/shared_helper.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = 'en';

  init() {
    String newLang = SharedPreferencesHelper.getLanguage();
    changeLanguage(newLang);
    bool isLightMode = SharedPreferencesHelper.getMode();
    if (isLightMode) {
      changeTheme(ThemeMode.light);
    } else {
      changeTheme(ThemeMode.dark);
    }
  }

  void changeTheme(ThemeMode mode) {
    if (mode == currentTheme) return;
    currentTheme = mode;
    if (mode == ThemeMode.light) {
      SharedPreferencesHelper.setMode(true);
    } else {
      SharedPreferencesHelper.setMode(false);
    }

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
    SharedPreferencesHelper.setLanguage(language);

    notifyListeners();
  }

  bool isEnglishEnabled() {
    return currentLanguage == 'en';
  }
}
