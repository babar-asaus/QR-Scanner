import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  final Color textColor;
  final Color dividerColor;
  final double dividerThickness;

  const SettingsWidget({
    super.key,
    required this.iconPath,
    required this.text,
    this.textColor = Colors.black,
    this.dividerColor = const Color(0x1A000000),
    this.dividerThickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(
          color: dividerColor,
          thickness: dividerThickness,
        ),
      ],
    );
  }
}
