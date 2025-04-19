import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveQrCodeController{
  Future<void> saveQRCode({
    required GlobalKey qrKey,
    required BuildContext context,
  }) async {
    try {
      // Request permission for photos (Android 13+)
      final status = await Permission.photos.request();
      if (status.isDenied || status.isPermanentlyDenied) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Photo permission is required to save the QR code.')),
        );
        return;
      }
      if (!status.isGranted) return;

      // Wait for the frame to render
      await Future.delayed(const Duration(milliseconds: 100));

      // Capture QR as image
      final boundary = qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to capture QR code.')),
        );
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0); // Higher resolution
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData?.buffer.asUint8List();

      if (buffer == null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to generate image data.')),
        );
        return;
      }

      // Save to gallery
      final result = await ImageGallerySaverPlus.saveImage(buffer);
      if (!context.mounted) return;

      if (result['isSuccess'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('QR saved to gallery!')),
        );
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save QR: ${result['error']}')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}