import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'logout_confirmation_screen.dart';
import 'settings_screen.dart'; // Ensure this is correctly pointing to your SettingsScreen

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreen();
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
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => SettingsScreen())),
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
  String _username = 'Jane Doe';
  int _totalRecycled = 150; // Total recycled material in kg
  int _nextBadgeThreshold = 200; // Next badge at 200kg

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        profileHeader(),
        SizedBox(height: 20),
        recyclingData(),
        SizedBox(height: 20),
        progressionBadges(),
        SizedBox(height: 20),
        button('Edit Profile', Colors.purple, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => EditProfileScreen()));
        }),
        SizedBox(height: 20),
        button('Logout', Colors.red, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => LogoutConfirmationScreen()));
        }),
      ],
    );
  }

  Widget profileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile_picture.png'),
        ),
        Text(
          _username,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget recyclingData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recycling Data',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('Total waste recycled: $_totalRecycled kg'),
        Text('Next badge at: $_nextBadgeThreshold kg'),
      ],
    );
  }

  Widget progressionBadges() {
    return ExpansionTile(
      title: Text('Progression Badges'),
      children: [
        Wrap(
          spacing: 8,
          children: List.generate(
              5,
              (index) => Icon(Icons.star,
                  color: index < _totalRecycled / 50
                      ? Colors.amber
                      : Colors.grey)),
        ),
      ],
    );
  }

  Widget button(String text, Color color, VoidCallback onPressed) {
    return Container(
      width: double
          .infinity, // This will make the button stretch to the full width of its parent container
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Background color
          foregroundColor: Colors.white, // Text color
        ),
        child: Text(text),
      ),
    );
  }
}
