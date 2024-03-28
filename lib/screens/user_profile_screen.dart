//File: lib/screens/user_profile_screen.dart
import 'package:flutter/material.dart';

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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add logic to navigate to settings
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Add logic to edit profile picture
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Username: JaneDoe',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 10.0),
          Text(
            'Email: janedoe@example.com',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          ListTile(
            title: Text('Recycling Stats'),
            subtitle: Text('Total waste recycled: 100kg'),
          ),
          ListTile(
            title: Text('Recycling History'),
            subtitle: Text('No recycling activities yet'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Add logic to edit profile
            },
            child: Text('Edit Profile'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Add logic to log out
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
