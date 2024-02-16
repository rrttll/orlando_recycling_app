import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? email, password;

  void _trySignUp() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      try {
        await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
        // Navigate to home screen or show a success message
      } catch (e) {
        // Handle sign up error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
              onSaved: (value) => email = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
              onSaved: (value) => password = value,
            ),
            ElevatedButton(
              onPressed: _trySignUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}