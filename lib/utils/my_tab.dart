import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  final String text;
  const MyTab({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, width: 36, height: 36),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}