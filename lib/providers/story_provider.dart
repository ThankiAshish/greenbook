import 'package:flutter/material.dart';
import 'package:greenbook/models/story.dart';

class StoryProvider extends ChangeNotifier {
  Story _story =
      Story(id: '', title: '', body: '', bannerPicture: '', likes: []);

  Story get story => _story;

  void setStory(String story) {
    _story = Story.fromJson(story);
    notifyListeners();
  }

  void setUserFromModel(Story storyModel) {
    _story = storyModel;
    notifyListeners();
  }
}
