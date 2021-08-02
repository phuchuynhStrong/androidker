import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AndroidkerUser with _$AndroidkerUser {
  factory AndroidkerUser({
    final String? id,
    final String? email,
    final String? displayName,
    final String? photoUrl,
  }) = _AndroidkerUser;
  factory AndroidkerUser.fromJson(Map<String, dynamic> json) =>
      _$AndroidkerUserFromJson(json);
}
