import 'package:authentication/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  AndroidkerUser? _user;

  void updateUser(AndroidkerUser? user) {
    _user = user;
    notifyListeners();
  }

  AndroidkerUser? getUser() {
    return _user;
  }
}
