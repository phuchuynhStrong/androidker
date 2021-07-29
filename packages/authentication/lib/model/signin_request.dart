import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_request.freezed.dart';
part 'signin_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  factory SignInRequest({
    final String? email,
    final String? password,
  }) = _SignInRequest;
  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);
}
