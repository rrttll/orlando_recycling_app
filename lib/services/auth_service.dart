import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart'; // Import logging

class AuthService {
  final FirebaseAuth _auth;
  final Logger _logger = Logger('AuthService'); // Create a logger instance

  AuthService({required FirebaseAuth auth}) : _auth = auth;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Log error
      _logger.severe('Failed to sign in with email and password: ${e.message}'); // Replace print with logger.severe
      rethrow;
    }
  }
}