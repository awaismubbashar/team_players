import 'package:flutter/cupertino.dart';

class AddTeamViewModel extends ChangeNotifier {

  List<String> players = [];

  Future<void> addPlayers(String name) async {
    players.add(name);
    notifyListeners();
  }
}