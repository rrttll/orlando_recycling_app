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
              _buildSettingItem('Edit Profile', Icons.person, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              }),
              _buildSettingItem('Change Password', Icons.lock, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                );
              }),
            ]),
            _buildSection('Notifications', [
              _buildSettingItem('Push Notifications', Icons.notifications, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PushNotificationsScreen()),
                );
              }),
              _buildSettingItem('Email Notifications', Icons.email, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmailNotificationsScreen()),
                );
              }),
            ]),
            _buildSection('Privacy', [
              _buildSettingItem('Data Usage', Icons.data_usage, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataUsageScreen()),
                );
              }),
              _buildSettingItem('Location', Icons.location_on, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationScreen()),
                );
              }),
            ]),
            _buildSection('About', [
              _buildSettingItem('Terms and Conditions', Icons.description, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                );
              }),
              _buildSettingItem('Privacy Policy', Icons.privacy_tip, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                );
              }),
              _buildSettingItem('Version', Icons.info, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VersionScreen()),
                );
              }),
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

  Widget _buildSettingItem(String title, IconData icon, Function() onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black87),
      ),
      leading: Icon(icon, color: Colors.green[700]),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green[700]),
      onTap: onTap,
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Text('Edit Profile Screen'),
      ),
    );
  }
}

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Center(
        child: Text('Change Password Screen'),
      ),
    );
  }
}

class PushNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications'),
      ),
      body: Center(
        child: Text('Push Notifications Screen'),
      ),
    );
  }
}

class EmailNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Notifications'),
      ),
      body: Center(
        child: Text('Email Notifications Screen'),
      ),
    );
  }
}

class DataUsageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Usage'),
      ),
      body: Center(
        child: Text('Data Usage Screen'),
      ),
    );
  }
}

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Text('Location Screen'),
      ),
    );
  }
}

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: Text('Terms and Conditions Screen'),
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Center(
        child: Text('Privacy Policy Screen'),
      ),
    );
  }
}

class VersionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version'),
      ),
      body: Center(
        child: Text('Version Screen'),
      ),
    );
  }
}
