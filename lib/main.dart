// File: lib/main.dart
import 'package:flutter/material.dart';
import 'screens/user_profile_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/community_feature_screen.dart';
import 'screens/recover_password_screen.dart';
import 'screens/map_schedule_screen.dart';
import 'screens/resources_screen.dart';
import 'screens/settings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orlando Recycles',
      theme: ThemeData(
        primaryColor: Colors.green[700],
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.green[500],
        ).copyWith(
          onPrimary: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black87,
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            color: Colors.green[700],
            fontWeight: FontWeight.bold,
          ),
        ),
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
  final List<Widget> _widgetOptions = [
    Scaffold(body: LoginScreen()),
    Scaffold(body: UserProfileScreen()),
    Scaffold(body: BarcodeScannerScreen()),
    Scaffold(body: CommunityFeatureScreen()),
    Scaffold(body: RecoverPasswordScreen()),
    Scaffold(body: MapScheduleScreen()),
    Scaffold(body: ResourcesScreen()),
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
      appBar: _selectedIndex == 0
          ? AppBar(
              title: Text('Orlando Recycles', style: Theme.of(context).textTheme.headline6),
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green[700],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.green[700]),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green[700]),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Colors.green[700]),
            label: 'Barcode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.green[700]),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open, color: Colors.green[700]),
            label: 'Recover Password',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.green[700]),
            label: 'Map Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details, color: Colors.green[700]),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.green[700]),
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
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Orlando Recycles', style: Theme.of(context).textTheme.headline6),
          SizedBox(height: 20),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              filled: true,
              isDense: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              isDense: true,
              fillColor: Colors.white,
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (usernameController.text.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarcodeScannerScreen()),
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
