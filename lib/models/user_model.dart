class User {
  final String id;
  final String phoneNumber;
  final String username;
  final String? profilePictureUrl;
  final bool isOnline;
  final String? lastSeen;
  
  User({
    required this.id,
    required this.phoneNumber,
    required this.username,
    this.profilePictureUrl,
    this.isOnline = false,
    this.lastSeen,
  });
  
  // Chuyển từ Map sang Object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      username: map['username'] ?? '',
      profilePictureUrl: map['profilePictureUrl'],
      isOnline: map['isOnline'] ?? false,
      lastSeen: map['lastSeen'],
    );
  }
  
  // Chuyển từ Object sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'username': username,
      'profilePictureUrl': profilePictureUrl,
      'isOnline': isOnline,
      'lastSeen': lastSeen,
    };
  }
}