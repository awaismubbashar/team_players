import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool passwordToggle = true;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
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
        ),
      ),
    );
  }

  Text loginText() => const Text(
        'Login',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
      );

  Text loginDescription() => const Text('Please sing in to continue');

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: emailController,
      validator: emailValidation,
      decoration: emailDecoration(),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: passwordController,
      validator: passwordValidation,
      decoration: passwordDecoration(),
      obscureText: passwordToggle,
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print("Validated");
        } else {
          print("Not Validated");
        }
      },
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

  InputDecoration emailDecoration() {
    return const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        prefixIcon: Icon(Icons.email),
        labelText: 'Email');
  }

  String? emailValidation(String? value) {
    bool emailReg = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value.isEmpty) {
      return "Enter email";
    } else if (!emailReg) {
      return "Enter valID email";
    }
    return null;
  }

  InputDecoration passwordDecoration() {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        prefixIcon: const Icon(Icons.key),
        labelText: 'Password',
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              passwordToggle = !passwordToggle;
            });
          },
          child: Icon(passwordToggle ? Icons.visibility : Icons.visibility_off),
        ));
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Enter Password";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    }
    return null;
  }
}
