//File: lib/screens/settings_screen.dart

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Account', [
              _buildSettingItem('Edit Profile', Icons.person),
              _buildSettingItem('Change Password', Icons.lock),
            ]),
            _buildSection('Notifications', [
              _buildSettingItem('Push Notifications', Icons.notifications),
              _buildSettingItem('Email Notifications', Icons.email),
            ]),
            _buildSection('Privacy', [
              _buildSettingItem('Data Usage', Icons.data_usage),
              _buildSettingItem('Location', Icons.location_on),
            ]),
            _buildSection('About', [
              _buildSettingItem('Terms and Conditions', Icons.description),
              _buildSettingItem('Privacy Policy', Icons.privacy_tip),
              _buildSettingItem('Version', Icons.info),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
        Column(
          children: items,
        ),
      ],
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black87),
      ),
      leading: Icon(icon, color: Colors.green[700]),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[700]),
      onTap: () {
        // Add logic for each setting item
      },
    );
  }
}
