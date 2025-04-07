import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialWidget extends StatelessWidget {
  final String iconPath;
  final String label;

  const SocialWidget({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
