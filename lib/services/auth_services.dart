import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenbook/providers/user_provider.dart';
import 'package:greenbook/screens/home_page.dart';
import 'package:greenbook/screens/login_page.dart';
import 'package:greenbook/utils/constants.dart';
import 'package:greenbook/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

class AuthService {
  void registerUser({
    required BuildContext context,
    required String name, 
    required String email,
    required String username,
    required String password,
    required dynamic profilePicture
  }) async {
    try {
      final uri = Uri.parse('${Constants.ashishPCUri}/api/register');
      final request = http.MultipartRequest('POST', uri);
      request.fields['name'] = name;
      request.fields['username'] = username;
      request.fields['email'] = email;
      request.fields['password'] = password;

      final imageFile = File(profilePicture);
      String extension = imageFile.path.split('.').last;
      final multipartFile = await http.MultipartFile.fromPath('photo', imageFile.path, contentType: MediaType('image', extension));

      request.files.add(multipartFile);

      request.headers.addAll({
        "Content-Type": "multipart/form-data",
        "content-disposition": 'form-data; name="photo"; filename="${multipartFile.filename}"'
      });

      final response = await request.send();

      if (response.statusCode == 200) {
        // final responseBody = await response.stream.bytesToString();
        // final userData = json.decode(responseBody);

        // ignore: use_build_context_synchronously
        showSnackBar(
             context, 
             'Account Created!, Now you can Login!'
        );
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(
             context, 
             'Failed to Create Account!'
        );
      }

      // await response.stream.bytesToString();

    } catch (error) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, error.toString());
    }
  }

  void loginUser({
    required BuildContext context,
    required String email,
    required String password
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.ashishPCUri}/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res, 
        context: context, 
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await preferences.setString('x-auth-token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage()
            ), 
            (route) => false
          );
        }
      );
    } catch (error) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, error.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString('x-auth-token');
    if(token == null) {
      preferences.setString('x-auth-token', '');
    }

    var tokenResponse = await http.post(
      Uri.parse('${Constants.ashishPCUri}/tokenValidation'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      }
    );

    var response = jsonDecode(tokenResponse.body);

    if(response == true) {
      http.Response userResponse = await http.get(
        Uri.parse('${Constants.uri}/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        }
      );

      userProvider.setUser(userResponse.body);
    }
  } 

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginPage()
      ),
      (route) => false
    );
  }
}