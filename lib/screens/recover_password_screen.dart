import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RecoverPasswordScreen()));
}

class RecoverPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Recover Password'),
                  content: RecoverPasswordForm(),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Forgot Password?'),
        ),
      ),
    );
  }
}

class RecoverPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Add logic to send password recovery email
            Navigator.of(context).pop();
          },
          child: Text('Send Recovery Email'),
        ),
      ],
    );
  }
}
