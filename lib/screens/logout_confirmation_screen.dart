// File: lib/screens/logout_confirmation_screen.dart

import 'package:flutter/material.dart';

class LogoutConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have successfully logged out.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
              child: Text('Back to Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, // For the background color
                foregroundColor: Colors
                    .white, // For the text color, corrected from onPrimary
              ),
            ),
          ],
        ),
      ),
    );
  }
}
