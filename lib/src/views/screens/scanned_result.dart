import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannedResult extends StatefulWidget {
  final String scannedValue;
  final BarcodeFormat format;

  const ScannedResult({
    super.key,
    required this.scannedValue,
    required this.format,
  });

  @override
  State<ScannedResult> createState() => _ScannedResultState();
}

class _ScannedResultState extends State<ScannedResult> {
  // Remove any initialization that depends on context or inherited widgets here

  @override
  void initState() {
    super.initState();
    // Defer any operations that need context to didChangeDependencies()
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // You can safely use context or inherited widgets here
  }

  @override
  Widget build(BuildContext context) {
    // Accessing localization or other inherited widgets is safe here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Scanned Result:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.scannedValue,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Format: ${_formatTypeToString(widget.format)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Use a Future.microtask to ensure this happens after build
            Future.microtask(() => _copyToClipboard(context));
          },
          icon: const Icon(Icons.copy),
          label: const Text('Copy'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.qr_code_scanner),
          label: const Text('Scan Again'),
        ),
      ],
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.scannedValue));
    // Show a snackbar using a post-frame callback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  String _formatTypeToString(BarcodeFormat format) {
    switch (format) {
      case BarcodeFormat.qrCode:
        return 'QR Code';
      case BarcodeFormat.aztec:
        return 'Aztec';
      case BarcodeFormat.codabar:
        return 'Codabar';
      case BarcodeFormat.code39:
        return 'Code 39';
      case BarcodeFormat.code93:
        return 'Code 93';
      case BarcodeFormat.code128:
        return 'Code 128';
      case BarcodeFormat.dataMatrix:
        return 'Data Matrix';
      case BarcodeFormat.ean8:
        return 'EAN-8';
      case BarcodeFormat.ean13:
        return 'EAN-13';
      case BarcodeFormat.itf:
        return 'ITF';
      case BarcodeFormat.pdf417:
        return 'PDF417';
      case BarcodeFormat.upcA:
        return 'UPC-A';
      case BarcodeFormat.upcE:
        return 'UPC-E';
      default:
        return 'Unknown';
    }
  }
}
