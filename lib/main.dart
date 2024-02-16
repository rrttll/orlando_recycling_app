import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this line
import 'information_database_screen.dart';
import 'user.dart' as userlib; // Use an alias for user.dart
import 'user_profile_screen.dart';

void main() async { // Add async keyword
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Remove the 'const' keyword from the constructor
  MyApp({Key? key}) : super(key: key);

  // Create a User object using the alias
  final user = userlib.User(
    username: 'username', // Replace with actual username
    fullName: 'Full Name', // Replace with actual full name
    profilePictureUrl: 'url', // Replace with actual profile picture URL
    recyclingGoals: 0, // Replace with actual recycling goals
    badgesEarned: [], // Replace with actual list of badges earned
    recyclingHistory: [], // Replace with actual recycling history
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/', // This is the route that is loaded first when the application starts.
      routes: {
        '/': (context) => UserProfileScreen(user: user), // Pass the User object to UserProfileScreen
        '/information_database': (context) => const InformationDatabaseScreen(),
      },
    );
  }
}