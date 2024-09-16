import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  Future<bool> login(String enteredEmail, String enteredPassword) async {
    try {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      final savedEmail = await prefs.getString('email');
      final savedPassword = await prefs.getString('password');

      if (savedEmail == enteredEmail && savedPassword == enteredPassword) {
        return true; // Login successful
      } else {
        return false; // Invalid credentials
      }
    } catch (e) {
      print('Error during login: $e');
      return false; // Error occurred
    }
  }
}
