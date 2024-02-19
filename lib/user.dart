// File: /lib/user.dart
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

  // Convert a User into a map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'fullName': fullName,
      'profilePictureUrl': profilePictureUrl,
      'recyclingGoals': recyclingGoals,
      'badgesEarned': badgesEarned,
      'recyclingHistory': recyclingHistory,
    };
  }

  // Create a User from a map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      fullName: map['fullName'],
      profilePictureUrl: map['profilePictureUrl'],
      recyclingGoals: map['recyclingGoals'],
      badgesEarned: List<String>.from(map['badgesEarned']),
      recyclingHistory: List<String>.from(map['recyclingHistory']),
    );
  }
}