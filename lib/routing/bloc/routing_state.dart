import 'package:freezed_annotation/freezed_annotation.dart';

part 'routing_state.freezed.dart';
part 'routing_state.g.dart';

@freezed
abstract class RoutingState with _$RoutingState {
  factory RoutingState({
    @Default(false) final bool isSplashScreenOver,
    @Default('') final String location,
  }) = _RoutingState;
  factory RoutingState.fromJson(Map<String, dynamic> json) =>
      _$RoutingStateFromJson(json);
  factory RoutingState.initial() => RoutingState.fromJson({});
}
