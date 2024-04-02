import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verifyEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordVisible = false;

  String getPasswordStrength(String password) {
    if (password.length < 12) {
      return 'Password should be at least 12 characters long.';
    }

    if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\d\s])').hasMatch(password)) {
      return 'Password should contain uppercase letters, lowercase letters, numbers, and symbols.';
    }

    return 'Strong password';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: verifyEmailController,
              decoration: InputDecoration(
                labelText: 'Verify Email',
                filled: true,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passwordController,
              onChanged: (_) => setState(() {}), // Update UI on password change
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              obscureText: !passwordVisible,
            ),
            SizedBox(height: 12),
            Text(
              getPasswordStrength(passwordController.text),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: passwordController.text.length / 14.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                passwordController.text.length >= 12 ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Validate passwords match and are strong
                if (passwordController.text == confirmPasswordController.text) {
                  // Implement account creation logic here
                  // For simplicity, let's just navigate back to the LoginScreen
                  Navigator.pop(context);
                } else {
                  // Show error message or handle weak password
                }
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
