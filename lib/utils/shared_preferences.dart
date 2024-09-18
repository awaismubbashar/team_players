import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferences {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Set String value
  static Future<void> setString({required String key, required String value}) async {
    _checkInitialization();
    await _preferences?.setString(key, value);
  }

  // Get String value
  static String? getString({required String key}) {
    _checkInitialization();
    return _preferences?.getString(key);
  }

  // Set Integer value
  static Future<void> setInt({required String key, required int value}) async {
    _checkInitialization();
    await _preferences?.setInt(key, value);
  }

  // Get Integer value
  static int? getInt({required String key}) {
    _checkInitialization();
    return _preferences?.getInt(key);
  }

  // Set Boolean value
  static Future<void> setBool({required String key, required bool value}) async {
    _checkInitialization();
    await _preferences?.setBool(key, value);
  }

  // Get Boolean value
  static bool? getBool({required String key}) {
    _checkInitialization();
    return _preferences?.getBool(key);
  }

  // Set Double value
  static Future<void> setDouble({required String key, required double value}) async {
    _checkInitialization();
    await _preferences?.setDouble(key, value);
  }

  // Get Double value
  static double? getDouble({required String key}) {
    _checkInitialization();
    return _preferences?.getDouble(key);
  }

  // Set List<String> value
  static Future<void> setStringList({required String key, required List<String> value}) async {
    _checkInitialization();
    await _preferences?.setStringList(key, value);
  }

  // Get List<String> value
  static List<String>? getStringList({required String key}) {
    _checkInitialization();
    return _preferences?.getStringList(key);
  }

  // Remove a key-value pair
  static Future<void> remove({required String key}) async {
    _checkInitialization();
    await _preferences?.remove(key);
  }

  // Clear all stored preferences
  static Future<void> clear() async {
    _checkInitialization();
    await _preferences?.clear();
  }

  // Check if key exists
  static bool containsKey({required String key}) {
    _checkInitialization();
    return _preferences?.containsKey(key) ?? false;
  }

  // Ensure _checkInitialization() is static so that it can be called in static methods
  static void _checkInitialization() {
    if (_preferences == null) {
      throw StateError('SharedPreferences not initialized. Call init() before using.');
    }
  }
}
