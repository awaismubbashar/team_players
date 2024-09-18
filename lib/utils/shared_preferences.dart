import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Set String value
  static Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Get String value
  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Set Integer value
  static Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  // Get Integer value
  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Set Boolean value
  static Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  // Get Boolean value
  static bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Set Double value
  static Future<void> setDouble(String key, double value) async {
    await _preferences?.setDouble(key, value);
  }

  // Get Double value
  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  // Set List<String> value
  static Future<void> setStringList(String key, List<String> value) async {
    await _preferences?.setStringList(key, value);
  }

  // Get List<String> value
  static List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  // Remove a key-value pair
  static Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Clear all stored preferences
  static Future<void> clear() async {
    await _preferences?.clear();
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }
}
