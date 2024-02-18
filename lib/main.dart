import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart'; // Import logging
import 'information_database_screen.dart';
import 'user.dart' as userlib;
import 'user_profile_screen.dart';
import 'services/api_service.dart'; // Import ApiService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // Create an instance of ApiService
  var apiService = ApiService();

  // Create a logger instance
  final logger = Logger('main');

  // Test getItems method
  var items = await apiService.getItems();
  logger.info('getItems result: $items'); // Replace print with logger.info

  // Test getItem method with valid ids
  for (var i = 1; i <= 11; i++) {
    var item = await apiService.getItem(i.toString());
    logger.info('getItem result for id $i: $item'); // Replace print with logger.info
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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