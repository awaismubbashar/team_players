import 'package:flutter/material.dart';

import '../model/player.dart';

class GeneralWidgets {
  static playersNameItem(String name) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(),
              ),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.cancel)
          ],
        ),
      ),
    );
  }

  static playersItem(Player player) {
    return Card(
      color: Colors.grey[200],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(child: Icon(player.image)),
            const SizedBox(width: 12),
            Text(
              player.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            Expanded(child: Container()),
            const Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
