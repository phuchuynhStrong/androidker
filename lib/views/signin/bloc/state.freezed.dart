// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInPageState _$SignInPageStateFromJson(Map<String, dynamic> json) {
  return _SignInPageState.fromJson(json);
}

/// @nodoc
class _$SignInPageStateTearOff {
  const _$SignInPageStateTearOff();

  _SignInPageState call(
      {bool isExecuting = false, bool executed = false, String? errorMsg}) {
    return _SignInPageState(
      isExecuting: isExecuting,
      executed: executed,
      errorMsg: errorMsg,
    );
  }

  SignInPageState fromJson(Map<String, Object> json) {
    return SignInPageState.fromJson(json);
  }
}

/// @nodoc
const $SignInPageState = _$SignInPageStateTearOff();

/// @nodoc
mixin _$SignInPageState {
  bool get isExecuting => throw _privateConstructorUsedError;
  bool get executed => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInPageStateCopyWith<SignInPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPageStateCopyWith<$Res> {
  factory $SignInPageStateCopyWith(
          SignInPageState value, $Res Function(SignInPageState) then) =
      _$SignInPageStateCopyWithImpl<$Res>;
  $Res call({bool isExecuting, bool executed, String? errorMsg});
}

/// @nodoc
class _$SignInPageStateCopyWithImpl<$Res>
    implements $SignInPageStateCopyWith<$Res> {
  _$SignInPageStateCopyWithImpl(this._value, this._then);

  final SignInPageState _value;
  // ignore: unused_field
  final $Res Function(SignInPageState) _then;

  @override
  $Res call({
    Object? isExecuting = freezed,
    Object? executed = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      isExecuting: isExecuting == freezed
          ? _value.isExecuting
          : isExecuting // ignore: cast_nullable_to_non_nullable
              as bool,
      executed: executed == freezed
          ? _value.executed
          : executed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SignInPageStateCopyWith<$Res>
    implements $SignInPageStateCopyWith<$Res> {
  factory _$SignInPageStateCopyWith(
          _SignInPageState value, $Res Function(_SignInPageState) then) =
      __$SignInPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isExecuting, bool executed, String? errorMsg});
}

/// @nodoc
class __$SignInPageStateCopyWithImpl<$Res>
    extends _$SignInPageStateCopyWithImpl<$Res>
    implements _$SignInPageStateCopyWith<$Res> {
  __$SignInPageStateCopyWithImpl(
      _SignInPageState _value, $Res Function(_SignInPageState) _then)
      : super(_value, (v) => _then(v as _SignInPageState));

  @override
  _SignInPageState get _value => super._value as _SignInPageState;

  @override
  $Res call({
    Object? isExecuting = freezed,
    Object? executed = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_SignInPageState(
      isExecuting: isExecuting == freezed
          ? _value.isExecuting
          : isExecuting // ignore: cast_nullable_to_non_nullable
              as bool,
      executed: executed == freezed
          ? _value.executed
          : executed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignInPageState implements _SignInPageState {
  _$_SignInPageState(
      {this.isExecuting = false, this.executed = false, this.errorMsg});

  factory _$_SignInPageState.fromJson(Map<String, dynamic> json) =>
      _$_$_SignInPageStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isExecuting;
  @JsonKey(defaultValue: false)
  @override
  final bool executed;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'SignInPageState(isExecuting: $isExecuting, executed: $executed, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPageState &&
            (identical(other.isExecuting, isExecuting) ||
                const DeepCollectionEquality()
                    .equals(other.isExecuting, isExecuting)) &&
            (identical(other.executed, executed) ||
                const DeepCollectionEquality()
                    .equals(other.executed, executed)) &&
            (identical(other.errorMsg, errorMsg) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsg, errorMsg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isExecuting) ^
      const DeepCollectionEquality().hash(executed) ^
      const DeepCollectionEquality().hash(errorMsg);

  @JsonKey(ignore: true)
  @override
  _$SignInPageStateCopyWith<_SignInPageState> get copyWith =>
      __$SignInPageStateCopyWithImpl<_SignInPageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignInPageStateToJson(this);
  }
}

abstract class _SignInPageState implements SignInPageState {
  factory _SignInPageState(
      {bool isExecuting, bool executed, String? errorMsg}) = _$_SignInPageState;

  factory _SignInPageState.fromJson(Map<String, dynamic> json) =
      _$_SignInPageState.fromJson;

  @override
  bool get isExecuting => throw _privateConstructorUsedError;
  @override
  bool get executed => throw _privateConstructorUsedError;
  @override
  String? get errorMsg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPageStateCopyWith<_SignInPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
