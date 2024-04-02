// File: lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/user_profile_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/community_feature_screen.dart';
import 'screens/educational_screen.dart';
import 'screens/map_schedule_screen.dart';
//import 'screens/resource_details_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlando Recycles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    if (index == 0) {
      if (_isLoggedIn) {
        _logout();
      } else {
        _login();
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Future<void> _login() async {
    // Navigate to the LoginScreen and await the result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    // If the result is true, set the state to logged in
    if (result == true) {
      setState(() {
        _isLoggedIn = true;
        _selectedIndex = 1; // Assuming the profile is at index 1
      });
    }
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
      _selectedIndex = 0; // Navigate back to the LoginScreen.
    });
  }

  @override
  Widget build(BuildContext context) {
    final _widgetOptions = <Widget>[
      LoginScreen(),
      UserProfileScreen(),
      BarcodeScannerScreen(),
      CommunityFeatureScreen(),
      EducationalScreen(),
      MapScheduleScreen(),
     // ResourceDetailsScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
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
          //BottomNavigationBarItem(
           // icon: Icon(Icons.details),
          //  label: 'Resources',
         // ),
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
