// File: lib/screens/user_profile_screen.dart
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String _username = 'Jane Daniels';
  int _totalRecycled = 220; // This is in pounds

  final int _totalBadges = 6; // Total badges for illustration
  final int _nextBadgeThreshold =
      100; // Threshold in pounds for earning the next badge

  // Calculate the number of badges earned
  int get _badgesEarned => _totalRecycled ~/ _nextBadgeThreshold;

  // Calculate pounds remaining to earn the next badge
  int get _poundsToNextBadge =>
      _nextBadgeThreshold - (_totalRecycled % _nextBadgeThreshold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  _username,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Recycling Achievements',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text('Total waste recycled: $_totalRecycled lbs'),
          Text('$_badgesEarned earned out of $_totalBadges 🌟'),
          Text('$_poundsToNextBadge lbs to next badge'),
          SizedBox(height: 10.0),
          Text('Every 5 badges plants a tree 🌳'),
          SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      () {}, // Placeholder for edit profile functionality
                  child: Text('Edit Profile'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              SizedBox(width: 10), // Adding some space between the buttons
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      () {}, // Placeholder for save profile functionality
                  child: Text('Save Profile'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
