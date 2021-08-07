// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInResponse _$_$_SignInResponseFromJson(Map<String, dynamic> json) {
  return _$_SignInResponse(
    user: json['user'] == null
        ? null
        : AndroidkerUser.fromJson(json['user'] as Map<String, dynamic>),
    refreshToken: json['refreshToken'] as String?,
    token: json['token'] as int?,
  );
}

Map<String, dynamic> _$_$_SignInResponseToJson(_$_SignInResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'refreshToken': instance.refreshToken,
      'token': instance.token,
    };
