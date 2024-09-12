import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              nameTextFormField(),
              const SizedBox(height: 20),
              emailTextFormField(),
              const SizedBox(height: 20),
              passwordTextFormField(),
              const SizedBox(height: 20),
              confirmPasswordTextFormField(),
              const SizedBox(height: 30),
              loginButton(),
              const SizedBox(height: 10),
              alreadyAccountText()
            ],
          ),
        ),
      ),
    );
  }

  Row alreadyAccountText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? '),
        Text(
          'Login',
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
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
        'SIGN UP',
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

  TextFormField confirmPasswordTextFormField() {
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
        labelText: 'Confirm Password',
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
        labelText: 'Email',
      ),
    );
  }

  TextFormField nameTextFormField() {
    return TextFormField(
      decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          prefixIcon: Icon(Icons.account_box_rounded),
          labelText: 'Name'),
    );
  }

  Text loginDescription() => const Text('Please sing up to continue');

  Text loginText() => const Text(
        'Create Account',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
      );
}
