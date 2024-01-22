import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences prefs;

  static setLanguage(String lang) {
    prefs.setString("lang", lang);
  }

  static String getLanguage() {
    return prefs.getString('lang') ?? 'en';
  }

  static setMode(bool mode) {
    prefs.setBool("mode", mode);
  }

  static bool getMode() {
    return prefs.getBool('mode') ?? true;
  }
}
