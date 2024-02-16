import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recycling_app/services/auth_service.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockUserCredential mockUserCredential;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockUserCredential = MockUserCredential();
      authService = AuthService(auth: mockFirebaseAuth);
    });

    test('sign in with email and password', () async {
      const email = 'test@example.com';
      const password = 'testPassword';

      when(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password))
          .thenAnswer((_) async => mockUserCredential);

      final result = await authService.signInWithEmailAndPassword(email, password);

      verify(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password)).called(1);
      expect(result, equals(mockUserCredential));
    });
  });
}