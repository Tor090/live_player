import 'package:flutter/material.dart';

class HeaderPlayer extends StatelessWidget {
  HeaderPlayer(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 603,
      color: Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 26, color: Colors.white)),
            Row(
              children: const [
                Icon(Icons.mic_off_rounded, size: 30, color: Colors.grey),
                Icon(Icons.fullscreen, size: 30, color: Colors.grey),
              ],
            )
          ],
        ),
      ),
    );
  }
}
