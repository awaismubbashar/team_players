import 'package:flutter/material.dart';
import 'package:team_players/screens/add_team.dart';
import 'package:team_players/screens/home.dart';
import 'package:team_players/screens/login.dart';
import 'package:team_players/screens/players.dart';
import 'package:team_players/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/players': (context) => const Players(),
        '/addTeam': (context) => const AddTeam(),
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
