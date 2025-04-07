import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/settings_header_svg.svg",
                  ),
                ),
              ),
              const SizedBox(height: 44),
              const SettingsWidget(
                iconPath: "assets/icons/privacy_svg.svg",
                text: "Privacy Policy",
              ),
              const SizedBox(height: 16),
              const SettingsWidget(
                iconPath: "assets/icons/share_svg.svg",
                text: "Share App",
              ),
              const SizedBox(height: 16),
              const SettingsWidget(
                iconPath: "assets/icons/rate_us_svg.svg",
                text: "Rate US",
              ),
              const SizedBox(height: 16),
              const SettingsWidget(
                iconPath: "assets/icons/about_svg.svg",
                text: "About US",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
