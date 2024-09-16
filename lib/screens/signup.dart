import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signup_viewmodel.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool passwordToggle = true;
  bool confirmPasswordToggle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                    signupButton(),
                    const SizedBox(height: 10),
                    alreadyAccountText()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text loginText() => const Text(
        'Create Account',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.blue),
      );

  Text loginDescription() => const Text('Please sing up to continue');

  TextFormField nameTextFormField() {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        } else if (value.length < 5) {
          return 'Name have at least 5 characters';
        }
      },
      decoration: fieldDecoration('Name', Icons.account_box_rounded),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: emailController,
      validator: emailValidation,
      decoration: fieldDecoration('Email', Icons.email),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: passwordController,
      validator: passwordValidation,
      decoration: passwordDecoration('Password'),
      obscureText: passwordToggle,
    );
  }

  TextFormField confirmPasswordTextFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      validator: (value) {
        if (value != passwordController.text) {
          return 'Password does not match';
        } else {
          return null;
        }
      },
      decoration: passwordDecoration('Confirm Password'),
      obscureText: confirmPasswordToggle,
    );
  }

  ElevatedButton signupButton() {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          try {
            await Provider.of<SignupViewModel>(context, listen: false)
                .saveUserData(
              emailController.text,
              nameController.text,
              passwordController.text,
            );
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            confirmPasswordController.clear();
            const SnackBar(
              content: Text('Signup successful'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            );
            await Navigator.pushReplacementNamed(context, '/login');
          } catch (e) {
            // Handle errors if saving data fails
            print("Error occurred: $e");
          }
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
        'SIGN UP',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
      ),
    );
  }

  Row alreadyAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  // This should move into extension fun
  InputDecoration fieldDecoration(String name, IconData icon) {
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
        prefixIcon: Icon(icon),
        labelText: name);
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

  InputDecoration passwordDecoration(String name) {
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
        labelText: name,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              if (name == 'Password') {
                passwordToggle = !passwordToggle;
              } else {
                confirmPasswordToggle = !confirmPasswordToggle;
              }
            });
          },
          child: Icon((name == 'Password'
              ? passwordToggle
                  ? Icons.visibility
                  : Icons.visibility_off
              : confirmPasswordToggle
                  ? Icons.visibility
                  : Icons.visibility_off)),
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
