// File: lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'user_profile_screen.dart'; // Ensure correct import path

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
  // Here you should implement the logic for verifying the credentials
  // For simplicity, I'm assuming the credentials are correct
  final username = _usernameController.text;
  final password = _passwordController.text;

  if (username.isNotEmpty && password.isNotEmpty) {
    // If login is successful, pop with a result to update the login state
    Navigator.of(context).pop(true);
  } else {
    // Show error or do nothing if login fails
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
