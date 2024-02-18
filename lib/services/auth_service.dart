import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';

class AuthService {
  final FirebaseAuth _auth;
  final Logger _logger = Logger('AuthService');

  AuthService({required FirebaseAuth auth}) : _auth = auth;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Log error using logging framework
      _logger.severe('Failed to sign in with email and password: ${e.message}');
      rethrow;
    }
  }
}
