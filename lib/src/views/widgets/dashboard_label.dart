import 'package:flutter/material.dart';

class DashboardLabel extends StatelessWidget {
  final String text;

  const DashboardLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
