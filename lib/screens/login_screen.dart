//File: lib/screens/login_screen.dart

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
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
        headline1: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.green[700],
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ));
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OrlandoGreen",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 20),
            Text("This is the Login Screen"),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implement forgot password logic here
              },
              child: Text("Forget Password?"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement change password logic here
              },
              child: Text("Change Password"),
            ),
          ],
        ),
      ),
    );
  }
}
