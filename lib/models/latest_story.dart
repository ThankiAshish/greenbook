import 'dart:convert';

class LatestStory {
  final String id;
  final String title;
  final String body;
  final List<dynamic> likes;
  final dynamic bannerPicture;
  final String userId;

  LatestStory ({
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
    required this.bannerPicture,
    required this.userId,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'body': body,
  //     'likes': likes,
  //     'bannerPicture': bannerPicture,
  //     'userId': userId
  //   };
  // }

  // factory LatestStory.fromMap(Map<String, dynamic> map) {
  //   return LatestStory(
  //     id: map['_id'] ?? '',
  //     title: map['title'] ?? '',
  //     body: map['body'] ?? '',
  //     likes: map['likes'] ?? [],
  //     bannerPicture: map['bannerPicture'] ?? '',
  //     userId: map['userId'] ?? '',
  //   );
  // }

  // String toJson() =>  json.encode(toMap());

  // factory LatestStory.fromJson(String source) => LatestStory.fromMap(json.decode(source));

  factory LatestStory.fromJson(Map<String, dynamic> json) {
    return LatestStory(
      id: json['_id'],
      title: json['title'],
      body: json['body'],
      likes: json['likes'],
      bannerPicture: json['bannerPicture'],
      userId: json['userId'],
    );
  }
}