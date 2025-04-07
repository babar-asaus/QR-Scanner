import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_scanner/src/views/screens/scanned_result.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final MobileScannerController _scannerController = MobileScannerController();
  bool _hasPermission = false;
  String _lastScanned = '';
  bool _isProcessingScan = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _hasPermission = status.isGranted;
    });

    if (!status.isGranted) {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Camera Permission Required'),
          content: const Text(
            'Please grant camera permission to use the scanner functionality.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isProcessingScan) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty && barcodes[0].rawValue != null) {
      final String scannedValue = barcodes[0].rawValue!;

      // Avoid duplicate scans
      if (_lastScanned != scannedValue) {
        setState(() {
          _isProcessingScan = true;
          _lastScanned = scannedValue;
        });

        // Pause the scanner immediately
        _scannerController.stop();

        // Play success sound
        // FlutterBeep.beep();  // Uncomment if FlutterBeep is available

        // Show scanned result
        _showScannedResult(scannedValue, barcodes[0].format);
      }
    }
  }

  void _showScannedResult(String scannedValue, BarcodeFormat format) {
    // Use Future.microtask to ensure this happens after the current build cycle
    Future.microtask(() {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ScannedResult(scannedValue: scannedValue, format: format),
          ),
        ).then((_) {
          // Resume scanning when returning from the result screen
          if (mounted) {
            _resumeScanner();
          }
        });
      }
    });
  }

  // Resume scanner when returning from result screen
  void _resumeScanner() {
    setState(() {
      _isProcessingScan = false;
    });
    _scannerController.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: _hasPermission
          ? Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  controller: _scannerController,
                  onDetect: _onDetect,
                ),
                // Torch Control Button
                Positioned(
                  top: 46,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: _scannerController.torchState,
                        builder: (context, state, child) {
                          return Icon(
                            state == TorchState.on
                                ? Icons.flash_on
                                : Icons.flash_off,
                            color: Colors.white,
                          );
                        },
                      ),
                      onPressed: () => _scannerController.toggleTorch(),
                    ),
                  ),
                ),
                // Camera Switch Button
                Positioned(
                  top: 46,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: _scannerController.cameraFacingState,
                        builder: (context, state, child) {
                          return Icon(
                            state == CameraFacing.front
                                ? Icons.camera_front
                                : Icons.camera_rear,
                            color: Colors.white,
                          );
                        },
                      ),
                      onPressed: () => _scannerController.switchCamera(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.black.withValues(alpha: 0.8),
            child: const Text(
              'Position the code within the frame to scan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
          : const Center(
        child: Text(
          'Camera permission is required for scanning',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
