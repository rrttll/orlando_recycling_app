// File: /lib/screens/user_profile_screen.dart
import 'package:flutter/material.dart';
import 'information_database_screen.dart';
import '../user.dart'; // Import the User class from user.dart

class RecyclingHistory {
  final DateTime date;
  final int itemsRecycled;

  const RecyclingHistory({
    required this.date,
    required this.itemsRecycled,
  });
}

class UserProfileScreen extends StatelessWidget {
  final User user;

  // Updated constructor with super parameter syntax
  const UserProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Username: ${user.username}',
            ),
            Text(
              'Full Name: ${user.fullName}',
            ),
            ElevatedButton(
              child: const Text('Go to Information Database'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InformationDatabaseScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
