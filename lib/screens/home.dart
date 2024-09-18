import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              nameText(),
              const SizedBox(height: 20),
              addTeamButton(),
              const SizedBox(height: 60),
              playerTeamCard(),
              logoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector playerTeamCard() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/players');
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.grey[200],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Team Gladiators',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          'Click here to see team players',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row nameText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Hello, John',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ],
    );
  }

  ElevatedButton addTeamButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/addTeam');
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.blue),
      child: const Text(
        'Add team',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
      ),
    );
  }

  ElevatedButton logoutButton() {
    return ElevatedButton(
      onPressed: () async {
        try {
          // final SharedPreferences prefs = await SharedPreferences.getInstance();
          // await asyncPrefs.clear();
          Navigator.pushReplacementNamed(context, '/login');
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logout failed. Please try again.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.blue),
      child: const Text(
        'Logout',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
      ),
    );
  }
}
