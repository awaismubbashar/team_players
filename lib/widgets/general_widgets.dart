import 'package:flutter/material.dart';

class GeneralWidgets {
  static playersItem(String name, BuildContext context) {
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
}
