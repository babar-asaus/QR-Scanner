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
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 24,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 10,
                  color: subtitleColor.withValues(alpha: 0.6),
                ),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [SvgPicture.asset(iconPath)],
            ),
          ),
        ],
      ),
    );
  }
}
