import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupViewModel extends ChangeNotifier {

  Future<void> saveUserData(String email, String name, String password) async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString('email', email);
    await prefs.setString('name', name);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getUserData() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    String? email = await prefs.getString('email');
    String? name = await prefs.getString('name');
    String? password = await prefs.getString('password');

    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

}
