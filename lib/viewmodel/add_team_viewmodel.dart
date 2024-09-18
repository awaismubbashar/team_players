import 'package:flutter/cupertino.dart';
import '../utils/shared_preferences.dart';

class AddTeamViewModel extends ChangeNotifier {
  List<String> players = [];
  bool isLoading = true;

  AddTeamViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await CustomSharedPreferences.init();
    await getPlayers();
  }

  Future<void> getPlayers() async {
    try {
      var list = CustomSharedPreferences.getStringList(key: 'playersList') ?? [];
      players = list;
    } catch (e) {
      print('Error retrieving players: $e');
      players = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addPlayers(String name) async {
    try {
      players.add(name);
      await CustomSharedPreferences.setStringList(key: 'playersList', value: players);
    } catch (e) {
      print('Error saving players: $e');
    }
    notifyListeners();
  }

  Future<void> removePlayers(String name) async {
    if (players.contains(name)) {
      players.remove(name);
      try {
        await CustomSharedPreferences.setStringList(key:'playersList', value: players);
      } catch (e) {
        print('Error saving players: $e');
      }
      notifyListeners();
    }
  }
}
