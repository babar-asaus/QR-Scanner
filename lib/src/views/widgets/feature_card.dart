import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color subtitleColor;

  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    this.backgroundColor = const Color(0xFFFFEBEB),
    this.iconBackgroundColor = Colors.red,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate font size scaling factor based on screen width
    double fontSizeFactor = MediaQuery.of(context).size.width / 375;
    // Set a reasonable icon size (adjustable)
    double iconSize = 40;

    return Container(
      // Removed fixed width to let Expanded handle sizing
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14 * fontSizeFactor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10 * fontSizeFactor,
                    color: subtitleColor.withValues(alpha: 0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            iconPath,
            height: iconSize,
            width: iconSize,
          ),
        ],
      ),
    );
  }
}
