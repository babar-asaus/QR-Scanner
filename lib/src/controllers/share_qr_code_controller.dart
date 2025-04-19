import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareQrCodeController{
  Future<void> shareQRCode({
    required GlobalKey qrKey,
    required BuildContext context,
    required String shareText,
  }) async {
    try {
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

      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/qr_code_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(buffer);

      // Share the file
      await Share.shareXFiles(
        [XFile(filePath, mimeType: 'image/png')],
        text: shareText,
      );

      // Clean up the temporary file
      await file.delete();
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing QR: $e')),
      );
    }
  }
}