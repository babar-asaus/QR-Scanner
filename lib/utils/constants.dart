
import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/create_screen.dart';
import 'package:qr_scanner/src/views/screens/history_screen.dart';
import 'package:qr_scanner/src/views/screens/scan_screen.dart';

import '../src/views/screens/settings_screen.dart';

final List<Widget> bottomNavList = [
  const ScanScreen(),
  const CreateScreen(),
  const HistoryScreen(),
  const SettingsScreen(),
];