import 'dart:convert';

import 'package:authentication/di/user_provider.dart';
import 'package:authentication/model/signin_response.dart';
import 'package:authentication/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSf extends Mock implements SharedPreferences {}

void main() {
  final mockSf = MockSf();
  final mockLoginResponse = SignInResponse(
    refreshToken: "refreshToken",
    user: AndroidkerUser(email: "test@gmail.com"),
  );
  final jsonContent = jsonEncode(mockLoginResponse.toJson());

  setUpAll(() {
    when(() => mockSf.setString(UserProvider.savedUserKey, jsonContent))
        .thenAnswer((invocation) => Future.value(true));
    when(() => mockSf.remove(UserProvider.savedUserKey))
        .thenAnswer((_) => Future.value(true));
    when(() => mockSf.getString(UserProvider.savedUserKey))
        .thenReturn(jsonContent);
  });

  test("Update user", () {
    final userProvider = UserProvider(sharedPreferences: mockSf)
      ..updateUser(null);

    expect(userProvider.getUser(), isNull);

    userProvider.updateUser(mockLoginResponse);
    expect(userProvider.getUser(), mockLoginResponse.user);
  });

  test("Get saved user", () {
    final getUserInstance = UserProvider(sharedPreferences: mockSf);
    expect(getUserInstance.getUser(), mockLoginResponse.user);
  });
}
