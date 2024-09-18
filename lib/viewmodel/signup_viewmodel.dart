import 'package:flutter/material.dart';

import '../utils/shared_preferences.dart';

class SignupViewModel extends ChangeNotifier {

  Future<void> saveUserData(String email, String name, String password) async {
    await CustomSharedPreferences.setString('email', email);
    await CustomSharedPreferences.setString('name', name);
    await CustomSharedPreferences.setString('password', password);
  }

  Future<Map<String, String?>> getUserData() async {
    String? email = CustomSharedPreferences.getString('email');
    String? name = CustomSharedPreferences.getString('name');
    String? password = CustomSharedPreferences.getString('password');

    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

}
