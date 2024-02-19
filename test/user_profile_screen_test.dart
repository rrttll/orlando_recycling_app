import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orlando_recycling_app/user_profile_screen.dart';
import 'package:orlando_recycling_app/information_database_screen.dart';
import 'package:orlando_recycling_app/user.dart';

void main() {
  testWidgets('navigate to InformationDatabaseScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: UserProfileScreen(user: User(
        username: 'test', 
        fullName: 'Test User',
        profilePictureUrl: 'http://example.com/profile.jpg', // Use a placeholder URL
        recyclingGoals: 0, // Add this
        badgesEarned: [], // Add this
        recyclingHistory: [], // Add this
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