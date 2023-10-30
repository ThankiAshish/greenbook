import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenbook/models/gardener_profile.dart';
import 'package:greenbook/models/users_list.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/utils/constants.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';

class UserServices {
  static fetchUsers(String exceptLoggedInUser) async {
    List<UsersList> usersList = [];
    var headers = {
      'Content-Type': 'application/json'
    };

    var request = http.Request(
      'POST',
      Uri.parse('${Constants.uri}/api/user/fetch/all')
    );

    request.body = json.encode({
      "email": exceptLoggedInUser  
    });

    request.headers.addAll(headers);
    
    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    
    if(res.statusCode == 200) {
      print(res.body);
      usersList = usersListFromJson(res.body.toString());
    }
    
    return usersList;
  }

  static fetchLatestUsers(String exceptLoggedInUser) async {
    List<UsersList> usersList = [];
    var headers = {
      'Content-Type': 'application/json'
    };

    var request = http.Request(
      'POST',
      Uri.parse('${Constants.uri}/api/user/fetch/latest')
    );

    request.body = json.encode({
      "email": exceptLoggedInUser  
    });

    request.headers.addAll(headers);
    
    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    
    if(res.statusCode == 200) {
      print(res.body);
      usersList = usersListFromJson(res.body.toString());
    }
    
    return usersList;
  }

  static fetchGardenerById(String id) async {
    final response = await http.get(Uri.parse('${Constants.uri}/api/user/fetch/$id'));

    GardenerProfile gardenerProfile = GardenerProfile(
      id: '', 
      name: '', 
      email: '', 
      username: '', 
      profilePicture: '', 
      followers: [], 
      following: []
    );

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      gardenerProfile = GardenerProfile.fromJson(data);
    }

    return gardenerProfile;
  }

   static followUser(String loggedInUserId, String toFollowId) async {
     bool isFollowing = false;
     var headers = {
       'Content-Type': 'application/json'
     };

     var request = http.Request(
         'PUT',
         Uri.parse('${Constants.uri}/api/user/follow')
     );

     request.body = json.encode({
       "loggedInUserId": loggedInUserId,
       "toFollowId": toFollowId
     });

     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();
     var res = await http.Response.fromStream(response);

     if(res.statusCode == 200) {
       isFollowing = true;
     }
     return isFollowing;
  }

  static unfollowUser(String loggedInUserId, String toFollowId) async {
    bool isFollowing = true;
    var headers = {
      'Content-Type': 'application/json'
    };

    var request = http.Request(
        'PUT',
        Uri.parse('${Constants.uri}/api/user/unfollow')
    );

    request.body = json.encode({
      "loggedInUserId": loggedInUserId,
      "toFollowId": toFollowId
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);

    if(res.statusCode == 200) {
      isFollowing = false;
    }
    return isFollowing;
  }

  void editProfileSettings(
      {required BuildContext context,
      required String id,
      required String name,
      required String email,
      required String username,
      required String password,
      required dynamic profilePicture}) async {
    try {
      final uri = Uri.parse('${Constants.uri}/api/user/profile/edit');
      final request = http.MultipartRequest('PUT', uri);
      request.fields['id'] = id;
      request.fields['name'] = name;

      final imageFile = File(profilePicture);
      String extension = imageFile.path.split('.').last;
      final multipartFile = await http.MultipartFile.fromPath(
          'photo', imageFile.path,
          contentType: MediaType('image', extension));

      request.files.add(multipartFile);

      request.headers.addAll({
        "Content-Type": "multipart/form-data",
        "content-disposition":
            'form-data; name="photo"; filename="${multipartFile.filename}"'
      });

      final response = await request.send();
      var res = await http.Response.fromStream(response);
      print(res.body);

      if (response.statusCode == 200) {
        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(res.body);
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Profile Edited');
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Failed to Save Changes!');
      }

      // await response.stream.bytesToString();
    } catch (error) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, error.toString());
    }
  }
}