//File: lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart'; // Ensure the path is correct

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
            icon: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Jane Daniels"),
            accountEmail: Text("jane.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
          ),
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: true,
            onChanged: (bool value) {
              // Here you can integrate your logic to handle notifications
            },
          ),
          ListTile(
            title: Text("Change Password"),
            leading: Icon(Icons.lock),
            onTap: () {
              // Integrate functionality to change password
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Preferences",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            title: Text("Language"),
            subtitle: Text(
                "English"), // This could be dynamic based on the actual setting
            leading: Icon(Icons.language),
            onTap: () {
              // Here you can integrate language change logic
            },
          ),
          SwitchListTile(
            title: Text("Dark Mode"),
            subtitle: Text(themeProvider.isDarkMode ? "On" : "Off"),
            value: themeProvider.isDarkMode,
            secondary: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onChanged: (bool value) {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
