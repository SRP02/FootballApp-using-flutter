import 'package:flutter/material.dart';

class Reusabletext extends StatelessWidget {
  final String label;
  const Reusabletext({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Text(
            label,
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 4
                ..color = Colors.black,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      );
  }
}