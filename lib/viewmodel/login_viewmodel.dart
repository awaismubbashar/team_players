import 'package:flutter/material.dart';
import '../utils/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  Future<bool> login(String enteredEmail, String enteredPassword) async {
    try {
      final savedEmail = CustomSharedPreferences.getString('email');
      final savedPassword = CustomSharedPreferences.getString('password');

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
