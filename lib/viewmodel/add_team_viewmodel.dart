import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTeamViewModel extends ChangeNotifier {
  List<String> players = [];
  bool isLoading = true;

  Future<void> getPlayers() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    var list = await prefs.getStringList('playersList');

    if (list != null) {
      players = list;
    }

    isLoading = false; // Set loading to false once data is fetched
    notifyListeners();
  }
  Future<void> addPlayers(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

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
