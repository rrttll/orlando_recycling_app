// File: lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'recover_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final VoidCallback onLogin;

  LoginScreen({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                isDense: true,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecoverPasswordScreen()),
                );
              },
              child: Text('Forgot Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty) {
                  onLogin();
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
