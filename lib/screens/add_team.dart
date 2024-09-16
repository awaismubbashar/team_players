import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../viewmodel/add_team_viewmodel.dart';
import '../widgets/general_widgets.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  final playerKey = GlobalKey<FormState>();
  var playerController = TextEditingController();

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
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Form(
            key: playerKey,
            child: Column(
              children: [
                addTeamText(),
                const SizedBox(height: 25),
                addTeamMemberText(),
                const SizedBox(height: 10),
                addTeamTextFormField(),
                const SizedBox(height: 10),
                addTeamButton(),
                const SizedBox(height: 20),
                Expanded(
                  child: Consumer<AddTeamViewModel>(
                    builder: (context, viewModel, child) {
                      return MasonryGridView.count(
                        itemCount: viewModel.players.length,
                        // Access players from the viewModel
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return GeneralWidgets.playersNameItem(
                              viewModel.players[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text addTeamText() {
    return const Text(
      'Add Team Players',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Row addTeamMemberText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Enter team player name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  TextFormField addTeamTextFormField() {
    return TextFormField(
      controller: playerController,
      validator: (name) {
        if (name!.isEmpty) {
          return 'Enter player name';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
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
          hintText: 'Smith',
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

  ElevatedButton addTeamButton() {
    return ElevatedButton(
      onPressed: () {
        final playerName = playerController.text;
        if (playerKey.currentState!.validate()) {
          Provider.of<AddTeamViewModel>(context, listen: false)
              .addPlayers(playerName);
          playerController.clear();
        }
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
}
