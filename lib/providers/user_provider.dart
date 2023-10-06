import 'package:flutter/material.dart';
import 'package:greenbook/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '', 
    name: '', 
    email: '', 
    username: '', 
    token: '', 
    password: ''
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User userModel) {
    _user = userModel;
    notifyListeners();
  }
}