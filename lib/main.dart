// File: lib/main.dart
import 'package:flutter/material.dart';
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
  final List<Widget> _widgetOptions = [
    Scaffold(body: LoginScreen()),
    Scaffold(body: UserProfileScreen()),
    Scaffold(body: BarcodeScannerScreen()),
    Scaffold(body: CommunityFeatureScreen()),
    Scaffold(body: EducationalScreen()),
    Scaffold(body: RecoverPasswordScreen()),
    Scaffold(body: MapScheduleScreen()),
    Scaffold(body: ResourceDetailsScreen()),
    Scaffold(body: SettingsScreen()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
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
            icon: Icon(Icons.lock_open),
            label: 'Recover Password',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Resource Details',
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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              filled: true,
              isDense: true,
            ),
          ),
          SizedBox(height: 12), // Gives a bit of space between the fields
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              isDense: true,
            ),
            obscureText: true,
          ),
          SizedBox(height: 20), // Gives a bit of space between the fields and the button
          TextButton(
            onPressed: () {
              // TODO: Implement "Forgot Password" functionality
            },
            child: Text('Forgot Password'),
          ),
        ],
      ),
    );
  }
}