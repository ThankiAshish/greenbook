import 'dart:convert';

List<UsersList> usersListFromJson(String str) => List<UsersList>.from(json.decode(str).map((x) => UsersList.fromJson(x)));
String usersListToJson(List<UsersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersList {
  final String id;
  final String name;
  final String email;
  final String username;
  final dynamic profilePicture;

  UsersList ({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.profilePicture
  });

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
      id: json["_id"] ?? '',
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      username: json["username"] ?? '',
      profilePicture: json["profilePicture"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'username': username,
    'profilePicture': profilePicture,
  };
}