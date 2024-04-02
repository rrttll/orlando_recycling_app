// File: lib/main.dart
// main.dart
import 'package:flutter/material.dart';
import 'screens/user_profile_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/community_feature_screen.dart';
import 'screens/map_schedule_screen.dart';
import 'screens/resources_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/recover_password_screen.dart'; // Added this import
import 'screens/create_account_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrlandoRecycles',
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
    LoginScreen(openRecoverPasswordScreen: _openRecoverPasswordScreen), // Pass the function to LoginScreen
    UserProfileScreen(),
    BarcodeScannerScreen(),
    CommunityFeatureScreen(),
    MapScheduleScreen(),
    ResourcesScreen(),
    SettingsScreen(),
  ];

  static void _openRecoverPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RecoverPasswordScreen()),
    );
  }

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
  final Function openRecoverPasswordScreen;

  LoginScreen({required this.openRecoverPasswordScreen});

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 60),
          Text(
            'OrlandoGreen',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              color: Colors.green[700],
            ),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  openRecoverPasswordScreen(context); // Use the function to open the RecoverPasswordScreen
                },
                child: Text('Forgot Password?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                  );
                },
                child: Text('Create Account'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (usernameController.text.isNotEmpty) {
                // Implement login logic here
                // For simplicity, let's just navigate to the BarcodeScannerScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
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
