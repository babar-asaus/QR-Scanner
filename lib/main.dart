import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  _statusBarColor();
  runApp(const MyApp());
}

void _statusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue
  ));
}


