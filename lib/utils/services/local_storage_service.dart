import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late SharedPreferences Preferences;

  static init() async {
    Preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return Preferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return Preferences.getBool(key);
  }
}
