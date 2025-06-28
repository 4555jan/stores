//imports
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
//barcode scanner the main logic to scaning the barcode and implementation of its value 
class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String scannedValue = '';
// init state is called once to take permissions for native api useage
  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }
// async funtion for camera permission 
  // which basically gets called once 
  void requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            //mobile_scanner is a Flutter plugin that allows you to scan barcodes
            child: MobileScanner(
              controller: MobileScannerController(
                facing: CameraFacing.back,
              ),
              //its on detect funtion takes it takes parameter barcode capture is class actually and capture variable is initalized internally
              onDetect: (BarcodeCapture capture) {
                final barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  final value = barcodes.first.rawValue;
                  if (value != null && value != scannedValue) {
                    setState(() {
                      scannedValue = value;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Scanned: $value')),
                    );
                  }
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                scannedValue.isNotEmpty
                    ? 'Scanned Code: $scannedValue'
                    : 'Waiting for barcode...',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
