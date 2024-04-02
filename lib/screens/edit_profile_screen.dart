// File: lib/screens/edit_profile_screen.dart

import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            // Add more fields as necessary
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
