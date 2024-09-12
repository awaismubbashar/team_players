import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loginText(),
              loginDescription(),
              const SizedBox(height: 50),
              emailTextFormField(),
              const SizedBox(height: 20),
              passwordTextFormField(),
              const SizedBox(height: 5),
              forgotPassword(),
              const SizedBox(height: 30),
              loginButton(),
              const SizedBox(height: 5),
              notHaveAccountText()
            ],
          ),
        ),
      ),
    );
  }

  Row notHaveAccountText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? '),
        Text(
          'Signup',
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }

  Container forgotPassword() {
    return Container(
        alignment: Alignment.bottomRight,
        child: const Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.blue,
            // decoration: TextDecoration.underline,
            // decorationColor: Colors.blue,
          ),
        ));
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.blue),
      child: const Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
      ),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        suffixIcon: Icon(Icons.remove_red_eye),
        prefixIcon: Icon(Icons.key),
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          prefixIcon: Icon(Icons.email),
          labelText: 'Email'),
    );
  }

  Text loginDescription() => const Text('Please sing in to continue');

  Text loginText() => const Text(
        'Login',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
      );
}
