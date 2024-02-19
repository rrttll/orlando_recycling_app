// File: /test/user_profile_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Update these import paths according to the new file locations
import 'package:recycling_app/screens/user_profile_screen.dart';
import 'package:recycling_app/screens/information_database_screen.dart';
import 'package:recycling_app/user.dart'; // Assuming 'user.dart' is directly under 'lib/'

void main() {
  testWidgets('navigate to InformationDatabaseScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: UserProfileScreen(user: User(
        username: 'test', 
        fullName: 'Test User',
        profilePictureUrl: 'http://example.com/profile.jpg', // Use a placeholder URL
        recyclingGoals: 0, // Assuming these fields exist in your User class
        badgesEarned: [], // Assuming these fields exist in your User class
        recyclingHistory: [], // Assuming these fields exist in your User class
      )),
    ));

    // Find the ElevatedButton.
    var button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);

    // Tap on the ElevatedButton.
    await tester.tap(button);
    await tester.pumpAndSettle();

    // Verify that we've navigated to the InformationDatabaseScreen.
    expect(find.byType(InformationDatabaseScreen), findsOneWidget);
  });
}
