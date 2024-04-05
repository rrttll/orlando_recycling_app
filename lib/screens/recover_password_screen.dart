import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatefulWidget {
  @override
  _RecoverPasswordScreenState createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _sendRecoverPasswordInstructions() {
    final email = _emailController.text;
    print('Sending password recovery instructions to: $email');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password recovery instructions sent to $email'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fixed width for the email field
    const double fieldWidth = 300.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recover Password"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Enter your email address and we'll send you instructions to reset your password.",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: fieldWidth, // Apply fixed width
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'you@example.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendRecoverPasswordInstructions,
              child: Text('Send Instructions'),
            ),
          ],
        ),
      ),
    );
  }
}
