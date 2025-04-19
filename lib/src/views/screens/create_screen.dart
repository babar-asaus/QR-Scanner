import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/main_cards/create_event.dart';
import 'package:qr_scanner/src/views/screens/main_cards/create_hotel.dart';
import 'package:qr_scanner/src/views/screens/social/create_facebook.dart';
import 'package:qr_scanner/src/views/screens/social/create_instagram.dart';
import 'package:qr_scanner/src/views/screens/social/create_linkedin.dart';
import 'package:qr_scanner/src/views/screens/social/create_twitter.dart';
import 'package:qr_scanner/src/views/screens/social/create_whatsapp.dart';
import 'package:qr_scanner/src/views/screens/social/create_youtube.dart';
import 'package:qr_scanner/src/views/screens/utility/create_location.dart';
import 'package:qr_scanner/src/views/screens/utility/create_text.dart';
import 'package:qr_scanner/src/views/screens/utility/create_url.dart';
import 'package:qr_scanner/src/views/screens/utility/create_wifi.dart';
import 'package:qr_scanner/src/views/widgets/feature_card.dart';
import 'package:qr_scanner/utils/strings.dart';

import '../widgets/social_widget.dart';
import 'main_cards/create_card.dart';
import 'main_cards/create_restaurant.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  qrScanner,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 24),
        
                // QR Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:
                          () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateLocation(),
                              ),
                            ),
                          },
                      child: SocialWidget(
                        iconPath: "assets/icons/location_svg.svg",
                        label: "Location",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateText(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/text_svg.svg",
                        label: "Text",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateWifi(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/wifi_svg.svg",
                        label: "Wifi",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateUrl(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/url_svg.svg",
                        label: "Url",
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 32),
        
        // Main Features Title
                const Text(
                  'Main Features',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
        
        // First Row of Cards
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateEvent()),
                          );
                        },
                        child: FeatureCard(
                          title: "Event",
                          subtitle: "Manage Event",
                          iconPath: "assets/icons/calendar_svg.svg",
                          backgroundColor: const Color(0x1FEC2525),
                          iconBackgroundColor: const Color(0x67EC2525),
                          subtitleColor: const Color(0x66000000),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateHotel()),
                          );
                        },
                        child: FeatureCard(
                          title: "Hotel",
                          subtitle: "Hotel Management",
                          iconPath: "assets/icons/hotel_svg.svg",
                          backgroundColor: const Color(0x1F1F58FF),
                          iconBackgroundColor: const Color(0x6F1F58FF),
                          subtitleColor: const Color(0x66000000),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
        
        // Second Row of Cards
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateRestaurant()),
                          );
                        },
                        child: FeatureCard(
                          title: "Restaurant",
                          subtitle: "Restaurant",
                          iconPath: "assets/icons/rest_svg.svg",
                          backgroundColor: const Color(0x1F0CBEFF),
                          iconBackgroundColor: const Color(0x6F0CBEFF),
                          subtitleColor: const Color(0x66000000),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateCard()),
                          );
                        },
                        child: FeatureCard(
                          title: "V Card",
                          subtitle: "Card",
                          iconPath: "assets/icons/card_svg.svg",
                          backgroundColor: const Color(0x1FFF8410),
                          iconBackgroundColor: const Color(0x6FFF8410),
                          subtitleColor: const Color(0x66000000),
                        ),
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 32),
        
                // Social Media
                const Text(
                  'Social Media',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
        
                const SizedBox(height: 16),
        
                // Social Media Grid - First Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateFacebook(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/fb_svg.svg",
                        label: "Facebook",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateLinkedin(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/in_svg.svg",
                        label: "LinkedIn",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateWhatsapp(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/whats_app_svg.svg",
                        label: "WhatsApp",
                      ),
                    ),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateTwitter(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/twitter_svg.svg",
                        label: "Twitter",
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 16),
        
                // Social Media Grid - Second Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateYoutube(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/youtube_svg.svg",
                        label: "Youtube",
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    InkWell(
                      onTap:
                          () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateInstagram(),
                          ),
                        ),
                      },
                      child: SocialWidget(
                        iconPath: "assets/icons/instagram_svg.svg",
                        label: "Instagram",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
