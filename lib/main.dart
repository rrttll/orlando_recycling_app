 // File: /lib/main.dart
import 'package:flutter/material.dart';
import 'package:logging/logging.dart'; // Import logging
import 'screens/information_database_screen.dart';
import 'user.dart' as userlib; // Assuming 'user.dart' is directly under 'lib/'
import 'screens/user_profile_screen.dart';
import 'services/api_service.dart'; // Assuming 'api_service.dart' is under 'lib/services/'

final _logger = Logger('main.dart');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // If Firebase is used, uncomment the following lines:
  // await Firebase.initializeApp();

  var apiService = ApiService();
  final logger = Logger('main');

  // Example API calls - ensure your ApiService and these methods are correctly implemented
  var items = await apiService.getItems();
  logger.info('getItems result: $items');

  for (var i = 1; i <= 11; i++) {
    var item = await apiService.getItem(i.toString());
    _logger.info('getItem result for id $i: $item');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Updated to use modern Dart syntax with super parameters.

  @override
  Widget build(BuildContext context) {
    // Temporarily creating a User object here for demonstration. Adjust as necessary.
    final user = userlib.User(
      username: 'username', 
      fullName: 'Full Name', 
      profilePictureUrl: 'url',
      recyclingGoals: 0,
      badgesEarned: [],
      recyclingHistory: [],
    );

    return MaterialApp(
      title: 'Recycling App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => UserProfileScreen(user: user),
        '/information_database': (context) => const InformationDatabaseScreen(),
      },
    );
  }
}
