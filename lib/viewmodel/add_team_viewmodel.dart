import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTeamViewModel extends ChangeNotifier {
  List<String> players = [];

  Future<void> getPlayers() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    var list = await prefs.getStringList('playersList');

    if(list != null) {
      print('add_team1 $list');
      players = list;
      notifyListeners();
    }
  }

  Future<void> addPlayers(String name) async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();

    players.add(name);
    await prefs.setStringList('playersList', players);
    notifyListeners();
  }

  Future<void> removePlayers(String name) async {
    if (players.contains(name)) {
      players.remove(name);
      notifyListeners();
    }
  }
}
