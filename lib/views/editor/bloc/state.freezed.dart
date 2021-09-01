// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditorPageState _$EditorPageStateFromJson(Map<String, dynamic> json) {
  return _EditorPageState.fromJson(json);
}

/// @nodoc
class _$EditorPageStateTearOff {
  const _$EditorPageStateTearOff();

  _EditorPageState call(
      {bool isExecuting = false,
      bool executed = false,
      EditorPageEvent action = EditorPageEvent.none,
      Article? data,
      String? errorMsg}) {
    return _EditorPageState(
      isExecuting: isExecuting,
      executed: executed,
      action: action,
      data: data,
      errorMsg: errorMsg,
    );
  }

  EditorPageState fromJson(Map<String, Object> json) {
    return EditorPageState.fromJson(json);
  }
}

/// @nodoc
const $EditorPageState = _$EditorPageStateTearOff();

/// @nodoc
mixin _$EditorPageState {
  bool get isExecuting => throw _privateConstructorUsedError;
  bool get executed => throw _privateConstructorUsedError;
  EditorPageEvent get action => throw _privateConstructorUsedError;
  Article? get data => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditorPageStateCopyWith<EditorPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorPageStateCopyWith<$Res> {
  factory $EditorPageStateCopyWith(
          EditorPageState value, $Res Function(EditorPageState) then) =
      _$EditorPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isExecuting,
      bool executed,
      EditorPageEvent action,
      Article? data,
      String? errorMsg});

  $ArticleCopyWith<$Res>? get data;
}

/// @nodoc
class _$EditorPageStateCopyWithImpl<$Res>
    implements $EditorPageStateCopyWith<$Res> {
  _$EditorPageStateCopyWithImpl(this._value, this._then);

  final EditorPageState _value;
  // ignore: unused_field
  final $Res Function(EditorPageState) _then;

  @override
  $Res call({
    Object? isExecuting = freezed,
    Object? executed = freezed,
    Object? action = freezed,
    Object? data = freezed,
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
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as EditorPageEvent,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Article?,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ArticleCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ArticleCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$EditorPageStateCopyWith<$Res>
    implements $EditorPageStateCopyWith<$Res> {
  factory _$EditorPageStateCopyWith(
          _EditorPageState value, $Res Function(_EditorPageState) then) =
      __$EditorPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isExecuting,
      bool executed,
      EditorPageEvent action,
      Article? data,
      String? errorMsg});

  @override
  $ArticleCopyWith<$Res>? get data;
}

/// @nodoc
class __$EditorPageStateCopyWithImpl<$Res>
    extends _$EditorPageStateCopyWithImpl<$Res>
    implements _$EditorPageStateCopyWith<$Res> {
  __$EditorPageStateCopyWithImpl(
      _EditorPageState _value, $Res Function(_EditorPageState) _then)
      : super(_value, (v) => _then(v as _EditorPageState));

  @override
  _EditorPageState get _value => super._value as _EditorPageState;

  @override
  $Res call({
    Object? isExecuting = freezed,
    Object? executed = freezed,
    Object? action = freezed,
    Object? data = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_EditorPageState(
      isExecuting: isExecuting == freezed
          ? _value.isExecuting
          : isExecuting // ignore: cast_nullable_to_non_nullable
              as bool,
      executed: executed == freezed
          ? _value.executed
          : executed // ignore: cast_nullable_to_non_nullable
              as bool,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as EditorPageEvent,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Article?,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EditorPageState implements _EditorPageState {
  _$_EditorPageState(
      {this.isExecuting = false,
      this.executed = false,
      this.action = EditorPageEvent.none,
      this.data,
      this.errorMsg});

  factory _$_EditorPageState.fromJson(Map<String, dynamic> json) =>
      _$_$_EditorPageStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isExecuting;
  @JsonKey(defaultValue: false)
  @override
  final bool executed;
  @JsonKey(defaultValue: EditorPageEvent.none)
  @override
  final EditorPageEvent action;
  @override
  final Article? data;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'EditorPageState(isExecuting: $isExecuting, executed: $executed, action: $action, data: $data, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditorPageState &&
            (identical(other.isExecuting, isExecuting) ||
                const DeepCollectionEquality()
                    .equals(other.isExecuting, isExecuting)) &&
            (identical(other.executed, executed) ||
                const DeepCollectionEquality()
                    .equals(other.executed, executed)) &&
            (identical(other.action, action) ||
                const DeepCollectionEquality().equals(other.action, action)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.errorMsg, errorMsg) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsg, errorMsg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isExecuting) ^
      const DeepCollectionEquality().hash(executed) ^
      const DeepCollectionEquality().hash(action) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(errorMsg);

  @JsonKey(ignore: true)
  @override
  _$EditorPageStateCopyWith<_EditorPageState> get copyWith =>
      __$EditorPageStateCopyWithImpl<_EditorPageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EditorPageStateToJson(this);
  }
}

abstract class _EditorPageState implements EditorPageState {
  factory _EditorPageState(
      {bool isExecuting,
      bool executed,
      EditorPageEvent action,
      Article? data,
      String? errorMsg}) = _$_EditorPageState;

  factory _EditorPageState.fromJson(Map<String, dynamic> json) =
      _$_EditorPageState.fromJson;

  @override
  bool get isExecuting => throw _privateConstructorUsedError;
  @override
  bool get executed => throw _privateConstructorUsedError;
  @override
  EditorPageEvent get action => throw _privateConstructorUsedError;
  @override
  Article? get data => throw _privateConstructorUsedError;
  @override
  String? get errorMsg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditorPageStateCopyWith<_EditorPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
