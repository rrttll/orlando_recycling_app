//File: lib/screens/barcode_scanner_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class BarcodeScannerScreen extends StatefulWidget {
  @override
  BarcodeScannerScreenState createState() => BarcodeScannerScreenState();
}

class BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode Scanner")),
      body: Center(
        child: Column( 
          children: <Widget> [ ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlue,
            ),
            onPressed: scanBarcode, icon: Icon(Icons.abc), label: Text("Scan a barcode")),
            Text("This is the Barcode Scanner Screen here is the result: $scanResult")],
       )
     )
    );
  }



Future scanBarcode() async {
  String scanResult;
  try {
    scanResult = await FlutterBarcodeScanner.scanBarcode(
      "ff6666",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
  } catch (ex) {
    print(ex);
    scanResult = "Failed to retrieve results";
  } 
  // on Exception {
  //   scanResult = "Failed to retrieve results";
  // } 

setState(() => this.scanResult = scanResult);

}
}