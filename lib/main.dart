//File: /main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/login_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/community_feature_screen.dart';
import 'screens/educational_screen.dart';
import 'screens/map_schedule_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/recover_password_screen.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlando Recycles',
      theme: Provider.of<ThemeProvider>(context).isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;

  void _onItemTapped(int index) {
    if (index == 0 && _isLoggedIn) {
      _logout();
    } else if (!_isLoggedIn && index != 0) {
      _showLoginPrompt();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _login() {
    setState(() {
      _isLoggedIn = true;
      _selectedIndex = 1; // Navigate to the UserProfileScreen
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _selectedIndex = 0; // Navigate back to the LoginScreen
    });
  }

  void _showLoginPrompt() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Not Logged In"),
        content: Text("Please log in to access this feature."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      LoginScreen(onLogin: _login),
      UserProfileScreen(),
      BarcodeScannerScreen(),
      CommunityFeatureScreen(),
      EducationalScreen(),
      MapScheduleScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(_isLoggedIn ? Icons.exit_to_app : Icons.login),
            label: _isLoggedIn ? 'Logout' : 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: _isLoggedIn ? 'Profile' : 'Not Logged In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Barcode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map & Pickups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
