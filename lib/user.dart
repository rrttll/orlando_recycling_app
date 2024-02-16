// This file defines the User class, which is a data model for user profiles in our app.
// It includes fields for a username, full name, profile picture URL, recycling goals, badges earned, and recycling history.
// Note: This is not the "information database" mentioned in our app features. The information database would be a separate 
//component of our app, likely with its own data model and database table or collection.
class User {
  final String username;
  final String fullName;
  final String profilePictureUrl;
  final int recyclingGoals;
  final List<String> badgesEarned;
  final List<String> recyclingHistory;

  User({
    required this.username,
    required this.fullName,
    required this.profilePictureUrl,
    required this.recyclingGoals,
    required this.badgesEarned,
    required this.recyclingHistory,
  });
}