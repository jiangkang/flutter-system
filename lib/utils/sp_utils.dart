import 'package:shared_preferences/shared_preferences.dart';

/// Key-Value 存储工具类
class SpUtils {
  SpUtils._();

  static Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<bool> saveInt(String key, int value) async {
    final prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<bool> saveDouble(String key, double value) async {
    final prefs = await _prefs;
    return prefs.setDouble(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    final prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key, bool defaultValue) async {
    final prefs = await _prefs;
    return prefs.getBool(key) ?? defaultValue;
  }

  static Future<bool> saveStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    return prefs.setStringList(key, value);
  }

  static String getString(String key, String defaultValue) {
    _prefs.then((value) {
      return value.getString(key);
    }).catchError((err) {
      return defaultValue;
    });
    return defaultValue;
  }
}
