import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final String colorName;
  const ColorCircle({super.key, required this.colorName});

  @override
  Widget build(BuildContext context) {
    final color = _mapColor(colorName);
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(width: 1.5)),
    );
  }

  Color _mapColor(String name) {
    name = name.toLowerCase().trim();

    if (name.contains("white")) return Colors.white;
    if (name.contains("black")) return Colors.black;
    if (name.contains("gray")) return Colors.grey;
    if (name.contains("silver")) return const Color(0xFFC0C0C0);
    if (name.contains("gold")) return const Color(0xFFFFD700);
    if (name.contains("blue")) return Colors.blue;
    if (name.contains("green")) return Colors.green;
    if (name.contains("red")) return Colors.red;
    if (name.contains("yellow")) return Colors.yellow;
    if (name.contains("purple")) return Colors.purple;
    if (name.contains("pink")) return const Color(0xFFFF69B4);
    if (name.contains("brown")) return Colors.brown;
    if (name.contains("orange")) return Colors.orange;

    return Colors.grey;
  }
}
