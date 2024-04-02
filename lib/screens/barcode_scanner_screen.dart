//File: lib/screens/barcode_scanner_screen.dart
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  BarcodeScannerScreenState createState() => BarcodeScannerScreenState();
}

class BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String scanResult = 'Scan a barcode to get started';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode Scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlue,
                ),
                onPressed: () => scanBarcode(),
                icon: Icon(Icons.camera),
                label: Text("Scan a barcode")),
            SizedBox(height: 20),
            Text("Scan result: $scanResult"),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        final scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666",
          "Cancel",
          true,
          ScanMode.BARCODE,
        );
        if (!mounted) return;
        setState(() {
          this.scanResult = scanResult;
        });
      } on PlatformException {
        scanResult = 'Failed to get platform version.';
      }
    } else {
      // Handle unsupported platforms
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Unsupported Platform"),
          content: Text("Barcode scanning is not supported on this platform."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
}
