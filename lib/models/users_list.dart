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

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'username': username,
  //     'profilePicture': profilePicture,
  //   };
  // }

  // factory UsersList.fromMap(Map<String, dynamic> map) {
  //   return UsersList(
  //     id: map['_id'] ?? '',
  //     name: map['name'] ?? '',
  //     email: map['email'] ?? '',
  //     username: map['username'] ?? '',
  //     profilePicture: map['profilePicture'] ?? '',
  //   );
  // }

  // String toJson() =>  json.encode(toMap());

  // factory UsersList.fromJson(String source) => UsersList.fromMap(json.decode(source));

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