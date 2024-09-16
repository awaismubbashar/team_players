import 'package:flutter/material.dart';
import 'package:team_players/widgets/general_widgets.dart';
import 'package:provider/provider.dart';
import '../viewmodel/add_team_viewmodel.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AddTeamViewModel>(context, listen: false).getPlayers();
    });
  }

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
      child: Consumer<AddTeamViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.players.length,
            itemBuilder: (BuildContext context, int index) {
              return GeneralWidgets.playersItem(viewModel.players[index]);
            },
          );
        },
      ),
    );
  }

  Center playerText() {
    return const Center(
      child: Text(
        'Your Team Players',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
