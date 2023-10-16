import 'dart:convert';

class Story {
  final String id;
  final String title;
  final String body;
  final List<dynamic> likes;
  final dynamic bannerPicture;

  Story ({
    required this.id,
    required this.title,
    required this.body,
    required this.bannerPicture,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'bannerPicture': bannerPicture,
      'likes': likes,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
        id: map['_id'] ?? '',
        title: map['title'] ?? '',
        body: map['body'] ?? '',
        bannerPicture: map['bannerPicture'] ?? '',
        likes: map['likes'] ?? '',
    );
  }

  String toJson() =>  json.encode(toMap());

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}