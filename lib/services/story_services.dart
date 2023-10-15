import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenbook/providers/story_provider.dart';
import 'package:greenbook/utils/constants.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class StoryService {
  void createStory(
      {required BuildContext context,
      required String id,
      required String title,
      required String body,
      required dynamic photo}) async {
    try {
      final uri = Uri.parse('${Constants.ashishPCUri}/api/story/store');
      final request = http.MultipartRequest('POST', uri);
      request.fields['userId'] = id;
      request.fields['title'] = title;
      request.fields['body'] = body;

      final storyImageFile = File(photo);
      String extension = storyImageFile.path.split('.').last;
      final multipartFile = await http.MultipartFile.fromPath(
          'photo', storyImageFile.path,
          contentType: MediaType('image', extension));

      request.files.add(multipartFile);

      request.headers.addAll({
        "Content-Type": "multipart/form-data",
        "content-disposition":
            'form-data; name="photo"; filename="${multipartFile.filename}"'
      });

      final response = await request.send();

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Story Created!');
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Failed to Create Story!');
      }
    } catch (error) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, error.toString());
    }
  }

  void getStory({required BuildContext context, required dynamic id}) async {
    try {
      final uri = Uri.parse('${Constants.ashishPCUri}/api/story/fetch?id=$id');
      var storyProvider = Provider.of<StoryProvider>(context, listen: false);
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            storyProvider.setStory(response.body);
          });
    } catch (error) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, error.toString());
    }
  }
}
