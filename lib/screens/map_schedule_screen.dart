import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class MapScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the platform is iOS or Android
    final bool isSupportedPlatform = Platform.isAndroid || Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: Text("Map & Pickups"),
      ),
      body: isSupportedPlatform
          ? Center(
              child: Text("WebView would be displayed on iOS/Android."),
              // Replace this Text widget with your WebView or similar when running on a supported platform.
            )
          : Center(
              child: Text(
                  "Maps are not supported on this platform. Please check on an iOS or Android device."),
            ),
    );
  }
}
