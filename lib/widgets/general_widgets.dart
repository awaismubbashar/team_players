import 'package:flutter/material.dart';

import '../model/player.dart';

class GeneralWidgets {
  static playersNameItem(String name, VoidCallback onCancel) {
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
            IconButton(
                icon: const Icon(Icons.cancel),
              onPressed: onCancel,
            )
          ],
        ),
      ),
    );
  }

  static playersItem(String player, VoidCallback onCancel) {
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
            const CircleAvatar(child: Icon(Icons.account_circle)),
            const SizedBox(width: 12),
            Text(
              player,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            Expanded(child: Container()),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onCancel,
            )
          ],
        ),
      ),
    );
  }
}
