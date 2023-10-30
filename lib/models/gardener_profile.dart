class GardenerProfile {
  final String id;
  final String name;
  final String email;
  final String username;
  final String profilePicture;
  final List<dynamic> followers;
  final List<dynamic> following;

  GardenerProfile({
    required this.id, 
    required this.name, 
    required this.email, 
    required this.username, 
    required this.profilePicture, 
    required this.followers, 
    required this.following
  });

  factory GardenerProfile.fromJson(Map<String, dynamic> json) {
    return GardenerProfile(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '', 
      username: json['username'] ?? '', 
      profilePicture: json['profilePicture'] ?? '', 
      followers: json['followers'] ?? [], 
      following: json['following'] ?? [],
    );
  }
}
