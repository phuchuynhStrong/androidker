import 'dart:convert';

import 'package:authentication/model/signin_response.dart';
import 'package:authentication/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final SharedPreferences? _sharedPreferences;

  static const savedUserKey = "saved_user";

  UserProvider({@required SharedPreferences? sharedPreferences})
      : assert(sharedPreferences != null),
        _sharedPreferences = sharedPreferences {
    final savedUserData = _sharedPreferences?.getString(savedUserKey);
    if (savedUserData != null) {
      final response = SignInResponse.fromJson(jsonDecode(savedUserData));
      _user = response.user;
    }
  }

  AndroidkerUser? _user;

  void updateUser(SignInResponse? response) {
    _user = response?.user;
    if (response == null) {
      _sharedPreferences?.remove(UserProvider.savedUserKey);
    }

    if (response != null) {
      _sharedPreferences?.setString(
          savedUserKey, jsonEncode(response.toJson()));
    }

    notifyListeners();
  }

  AndroidkerUser? getUser() {
    return _user;
  }
}
