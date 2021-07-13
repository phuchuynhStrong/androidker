// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'routing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutingState _$RoutingStateFromJson(Map<String, dynamic> json) {
  return _RoutingState.fromJson(json);
}

/// @nodoc
class _$RoutingStateTearOff {
  const _$RoutingStateTearOff();

  _RoutingState call({bool isSplashScreenOver = false, String location = ''}) {
    return _RoutingState(
      isSplashScreenOver: isSplashScreenOver,
      location: location,
    );
  }

  RoutingState fromJson(Map<String, Object> json) {
    return RoutingState.fromJson(json);
  }
}

/// @nodoc
const $RoutingState = _$RoutingStateTearOff();

/// @nodoc
mixin _$RoutingState {
  bool get isSplashScreenOver => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutingStateCopyWith<RoutingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutingStateCopyWith<$Res> {
  factory $RoutingStateCopyWith(
          RoutingState value, $Res Function(RoutingState) then) =
      _$RoutingStateCopyWithImpl<$Res>;
  $Res call({bool isSplashScreenOver, String location});
}

/// @nodoc
class _$RoutingStateCopyWithImpl<$Res> implements $RoutingStateCopyWith<$Res> {
  _$RoutingStateCopyWithImpl(this._value, this._then);

  final RoutingState _value;
  // ignore: unused_field
  final $Res Function(RoutingState) _then;

  @override
  $Res call({
    Object? isSplashScreenOver = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      isSplashScreenOver: isSplashScreenOver == freezed
          ? _value.isSplashScreenOver
          : isSplashScreenOver // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RoutingStateCopyWith<$Res>
    implements $RoutingStateCopyWith<$Res> {
  factory _$RoutingStateCopyWith(
          _RoutingState value, $Res Function(_RoutingState) then) =
      __$RoutingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isSplashScreenOver, String location});
}

/// @nodoc
class __$RoutingStateCopyWithImpl<$Res> extends _$RoutingStateCopyWithImpl<$Res>
    implements _$RoutingStateCopyWith<$Res> {
  __$RoutingStateCopyWithImpl(
      _RoutingState _value, $Res Function(_RoutingState) _then)
      : super(_value, (v) => _then(v as _RoutingState));

  @override
  _RoutingState get _value => super._value as _RoutingState;

  @override
  $Res call({
    Object? isSplashScreenOver = freezed,
    Object? location = freezed,
  }) {
    return _then(_RoutingState(
      isSplashScreenOver: isSplashScreenOver == freezed
          ? _value.isSplashScreenOver
          : isSplashScreenOver // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoutingState implements _RoutingState {
  _$_RoutingState({this.isSplashScreenOver = false, this.location = ''});

  factory _$_RoutingState.fromJson(Map<String, dynamic> json) =>
      _$_$_RoutingStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isSplashScreenOver;
  @JsonKey(defaultValue: '')
  @override
  final String location;

  @override
  String toString() {
    return 'RoutingState(isSplashScreenOver: $isSplashScreenOver, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoutingState &&
            (identical(other.isSplashScreenOver, isSplashScreenOver) ||
                const DeepCollectionEquality()
                    .equals(other.isSplashScreenOver, isSplashScreenOver)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isSplashScreenOver) ^
      const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  _$RoutingStateCopyWith<_RoutingState> get copyWith =>
      __$RoutingStateCopyWithImpl<_RoutingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RoutingStateToJson(this);
  }
}

abstract class _RoutingState implements RoutingState {
  factory _RoutingState({bool isSplashScreenOver, String location}) =
      _$_RoutingState;

  factory _RoutingState.fromJson(Map<String, dynamic> json) =
      _$_RoutingState.fromJson;

  @override
  bool get isSplashScreenOver => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoutingStateCopyWith<_RoutingState> get copyWith =>
      throw _privateConstructorUsedError;
}
