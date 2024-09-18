import 'package:flutter/material.dart';

import '../utils/shared_preferences.dart';

class SignupViewModel extends ChangeNotifier {

  Future<void> saveUserData(String email, String name, String password) async {
    await CustomSharedPreferences.setString(key: 'email', value: email);
    await CustomSharedPreferences.setString(key: 'name', value: name);
    await CustomSharedPreferences.setString(key: 'password', value: password);
  }

  Future<Map<String, String?>> getUserData() async {
    String? email = CustomSharedPreferences.getString(key: 'email');
    String? name = CustomSharedPreferences.getString(key: 'name');
    String? password = CustomSharedPreferences.getString(key: 'password');

    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

}
