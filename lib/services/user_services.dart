import 'dart:convert';

import 'package:greenbook/models/users_list.dart';
import 'package:greenbook/utils/constants.dart';
import 'package:http/http.dart' as http;

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
}