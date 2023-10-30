import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String username; 
  final String token;
  final String password;
  final dynamic profilePicture;
  final List<dynamic> followers;
  final List<dynamic> following;
  final dynamic points;

  User ({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.token,
    required this.password,
    required this.profilePicture,
    required this.followers,
    required this.following,
    required this.points
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'token': token,
      'password': password,
      'profilePicture': profilePicture,
      'followers': followers,
      'following': following,
      'points': points
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      followers: map['followers'] ?? [],
      following: map['following'] ?? [],
      points: map['points'] ?? 0
    );
  }

  String toJson() =>  json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}