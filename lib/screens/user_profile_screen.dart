//File: lib/screens/user_profile_screen.dart

import 'package:flutter/material.dart';
import 'package:orlando_recycling_app/screens/edit_profile_screen.dart';
import 'package:orlando_recycling_app/screens/settings_screen.dart'
    as SettingsScreen;

void main() {
  runApp(UserProfileScreen());
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[700],
        scaffoldBackgroundColor: Colors.green[50],
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.green[500],
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black87,
          ),
        ),
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsScreen.SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = 'Jane Daniels';
  int _totalRecycled = 100;
  int _nextBadgeThreshold = 50;

  void _logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogoutConfirmationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  'assets/afro_girl.gif'), // Assuming the animated girl image is in assets
            ),
            SizedBox(width: 10.0),
            Text(
              '$_username',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recycling Data',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text('Total waste recycled: $_totalRecycled kg'),
                  Text('Next badge at: $_nextBadgeThreshold kg'),
                ],
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recycling History',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text('No recycling activities yet'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        ExpansionTile(
          title: Text('Progression Badges'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(9, (index) {
                return CircleAvatar(
                  backgroundColor: index < 3
                      ? Color.fromARGB(255, 60, 221, 100)
                      : Colors.grey,
                  child: Icon(
                    Icons.circle,
                    color: Colors.black,
                  ),
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
          },
          child: Text('Edit Profile'),
        ),
        //SizedBox(height: 20.0),
        //ElevatedButton(
        //  onPressed: _logout,
        //  child: Text('Logout'),
        //),
      ],
    );
  }
}

class LogoutConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have successfully logged out.'),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
