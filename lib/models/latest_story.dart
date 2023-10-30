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