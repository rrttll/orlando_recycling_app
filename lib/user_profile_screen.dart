import 'package:flutter/material.dart';
import 'information_database_screen.dart';

class User {
  final String username;
  final String fullName;
  final String profilePictureUrl;
  int recyclingGoals;
  List<String> badgesEarned;
  List<RecyclingHistory> recyclingHistory;

  User({
    required this.username,
    required this.fullName,
    this.profilePictureUrl = '',
    this.recyclingGoals = 0,
    this.badgesEarned = const [],
    this.recyclingHistory = const [],
  });
}

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

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

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