import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, "/home"),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Text(
            appTag,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
