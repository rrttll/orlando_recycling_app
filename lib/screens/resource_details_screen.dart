//File: lib/screens/resource_details_screen.dart
import 'package:flutter/material.dart';

class ResourceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resource Details")),
      body: Center(child: Text("Details about the selected recycling resource")),
    );
  }
}
