import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class SignInPageState with _$SignInPageState {
  factory SignInPageState({
    @Default(false) final bool isExecuting,
    @Default(false) final bool executed,
    @Default(false) final bool loggedIn,
    final String? errorMsg,
  }) = _SignInPageState;
  factory SignInPageState.fromJson(Map<String, dynamic> json) =>
      _$SignInPageStateFromJson(json);
  factory SignInPageState.initial() => SignInPageState.fromJson({});
}
