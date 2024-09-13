import 'package:flutter/material.dart';
import 'package:team_players/widgets/general_widgets.dart';
import '../model/player.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  List<Player> playersList = [
    Player('Smith', Icons.account_circle),
    Player('Joseph', Icons.account_circle),
    Player('Billa', Icons.account_circle),
    Player('David', Icons.account_circle),
    Player('Pakola', Icons.account_circle)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              playerText(),
              const SizedBox(height: 30),
              playersListView()
            ],
          ),
        ),
      ),
    );
  }

  Expanded playersListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (BuildContext context, int index) {
          return GeneralWidgets.playersItem(playersList[index]);
        },
      ),
    );
  }

  Center playerText() {
    return const Center(
      child: Text(
        'Players',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
