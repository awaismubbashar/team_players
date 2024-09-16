import 'package:flutter/material.dart';
import 'package:team_players/screens/add_team.dart';
import 'package:team_players/screens/home.dart';
import 'package:team_players/screens/login.dart';
import 'package:team_players/screens/players.dart';
import 'package:team_players/screens/signup.dart';
import 'package:team_players/viewmodel/add_team_viewmodel.dart';
import 'package:team_players/viewmodel/login_viewmodel.dart';
import 'package:team_players/viewmodel/signup_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => AddTeamViewModel()),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        routes: {
          '/players': (context) => const Players(),
          '/addTeam': (context) => const AddTeam(),
          '/home': (context) => const Home(),
          '/signup': (context) => const Signup(),
          '/login': (context) => const Login(),
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  void _startSplashScreen() {
    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 5));
      await _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    try {
      final SharedPreferencesAsync prefs = SharedPreferencesAsync();
      final email = await prefs.getString('email');
      final password = await prefs.getString('password');

      print('email pref $email');

      if (email != null && password != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      print('Error checking login status: $e');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        child: Center(child: Image.asset('assets/sports.jpg')),
      ),
    );
  }
}
