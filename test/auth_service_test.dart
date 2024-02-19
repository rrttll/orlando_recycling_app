import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:orlando_recycling_app/services/auth_service.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  final MockUserCredential mockUserCredential = MockUserCredential();

  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) {
    return Future.value(mockUserCredential);
  }
}

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authService = AuthService(auth: mockFirebaseAuth);
    });

    test('sign in with email and password', () async {
      const email = 'test@example.com';
      const password = 'testPassword';

      final result = await authService.signInWithEmailAndPassword(email, password);

      expect(result, equals(mockFirebaseAuth.mockUserCredential));
    });
  });
}