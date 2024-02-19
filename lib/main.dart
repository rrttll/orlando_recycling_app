import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'information_database_screen.dart';
import 'user.dart' as userlib;
import 'user_profile_screen.dart';
import 'services/api_service.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var apiService = ApiService();

  final logger = Logger('main');

  var items = await apiService.getItems(); // Call getItems() on the ApiService instance without any arguments
  logger.info('getItems result: $items');

  for (var i = 1; i <= 11; i++) {
    var item = await apiService.getItem(i.toString()); // Call getItem() on the ApiService instance with only one argument
    logger.info('getItem result for id $i: $item');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final user = userlib.User(
    username: 'username',
    fullName: 'Full Name',
    profilePictureUrl: 'url',
    recyclingGoals: 0,
    badgesEarned: [],
    recyclingHistory: [],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recycling App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/information_database': (context) => const InformationDatabaseScreen(),
        '/user_profile': (context) => UserProfileScreen(user: user),
      },
    );
  }
}