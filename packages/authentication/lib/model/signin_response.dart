import 'package:authentication/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_response.freezed.dart';
part 'signin_response.g.dart';

@freezed
class SignInResponse with _$SignInResponse {
  factory SignInResponse({
    final AndroidkerUser? user,
    final String? refreshToken,
    final int? token,
  }) = _SignInResponse;
  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
