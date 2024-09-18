import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupViewModel extends ChangeNotifier {

  Future<void> saveUserData(String email, String name, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('name', name);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? name = prefs.getString('name');
    String? password = prefs.getString('password');

    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

}
