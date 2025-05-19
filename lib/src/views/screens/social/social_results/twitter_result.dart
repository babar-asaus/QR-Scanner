import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../controllers/save_qr_code_controller.dart';
import '../../../../controllers/share_qr_code_controller.dart';
import '../../../widgets/social_widget.dart';

class TwitterResult extends StatefulWidget {
  final String data;
  const TwitterResult({super.key, required this.data});

  @override
  State<TwitterResult> createState() => _TwitterResultState();
}

class _TwitterResultState extends State<TwitterResult> {
  late SaveQrCodeController _qrCodeController;
  late ShareQrCodeController _shareQrCodeController;

  final GlobalKey _qrKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _qrCodeController = SaveQrCodeController();
    _shareQrCodeController = ShareQrCodeController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 50),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Transform.translate(
                offset: Offset(0, MediaQuery.of(context).size.height * -0.05),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SocialWidget(
                          iconPath: "assets/icons/twitter_svg.svg",
                          label: "Twitter",
                        ),
                        SizedBox(height: 40),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 210,
                              height: 210,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: RepaintBoundary(
                                  key: _qrKey,
                                  child: Container(
                                    width: 200,
                                    // Ensure exact size
                                    height: 200,
                                    // Ensure exact size
                                    color: Colors.white,
                                    // Ensure white background
                                    child: QrImageView(
                                      data: widget.data,
                                      version: QrVersions.auto,
                                      size: 200.0,
                                      backgroundColor:
                                      Colors
                                          .white, // Explicitly set white background
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: -15,
                              right: -12,
                              // Optional for rounded shadow
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/edit_qr_svg.svg",
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _shareQrCodeController.shareQRCode(
                      qrKey: _qrKey,
                      context: context,
                      shareText: 'Text: ${widget.data}',
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text("Share", style: TextStyle(color: Colors.white)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _qrCodeController.saveQRCode(
                      qrKey: _qrKey,
                      context: context,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      "Download",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}