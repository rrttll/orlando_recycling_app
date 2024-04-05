import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Jane Daniels"),
            accountEmail: Text("jane.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/profile_picture.png'), // Use local asset
              // If you don't have this image, either add one or revert to using NetworkImage
            ),
            // Removed onDetailsPressed to eliminate the dropdown arrow
          ),
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: true,
            onChanged: (bool value) {
              // Handle change
            },
          ),
          ListTile(
            title: Text("Change Password"),
            leading: Icon(Icons.lock),
            onTap: () {
              // Navigate to change password
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Preferences",
                style: Theme.of(context).textTheme.headline6),
          ),
          ListTile(
            title: Text("Language"),
            subtitle: Text("English"),
            leading: Icon(Icons.language),
            onTap: () {
              // Handle Language change
            },
          ),
          ListTile(
            title: Text("Theme"),
            subtitle: Text("Dark"),
            leading: Icon(Icons.brightness_4),
            onTap: () {
              // Handle Theme change
            },
          ),
        ],
      ),
    );
  }
}
