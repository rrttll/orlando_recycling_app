// File: lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/community_feature_screen.dart';
import 'screens/educational_screen.dart';
import 'screens/recover_password_screen.dart';
import 'screens/map_schedule_screen.dart';
import 'screens/resource_details_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlando Recycles',
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
    if (_isLoggedIn && index == 0) {
      _logout();
    } else if (_isLoggedIn || index == 0) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      // Optionally, handle attempts to navigate while logged out
      // e.g., showing a dialog that login is required
    }
  }

  void _login() {
    setState(() {
      _isLoggedIn = true;
      _selectedIndex =
          1; // Optionally navigate to a different screen upon login
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _selectedIndex = 0; // Navigate back to the LoginScreen.
    });
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
      ResourceDetailsScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
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
            label: 'Profile',
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
            icon: Icon(Icons.details),
            label: 'Resources',
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
