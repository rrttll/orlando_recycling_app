//File: lib/screens/barcode_scanner_screen.dart
import 'package:flutter/material.dart';

class BarcodeScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode Scanner")),
      body: Center(child: Text("This is the Barcode Scanner Screen")),
    );
  }
}
