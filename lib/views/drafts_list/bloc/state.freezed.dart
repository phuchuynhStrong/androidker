// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DraftsListState _$DraftsListStateFromJson(Map<String, dynamic> json) {
  return _DraftsListState.fromJson(json);
}

/// @nodoc
class _$DraftsListStateTearOff {
  const _$DraftsListStateTearOff();

  _DraftsListState call(
      {bool isFetching = false,
      bool fetched = false,
      List<Article> data = const [],
      String? errorMsg}) {
    return _DraftsListState(
      isFetching: isFetching,
      fetched: fetched,
      data: data,
      errorMsg: errorMsg,
    );
  }

  DraftsListState fromJson(Map<String, Object> json) {
    return DraftsListState.fromJson(json);
  }
}

/// @nodoc
const $DraftsListState = _$DraftsListStateTearOff();

/// @nodoc
mixin _$DraftsListState {
  bool get isFetching => throw _privateConstructorUsedError;
  bool get fetched => throw _privateConstructorUsedError;
  List<Article> get data => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DraftsListStateCopyWith<DraftsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftsListStateCopyWith<$Res> {
  factory $DraftsListStateCopyWith(
          DraftsListState value, $Res Function(DraftsListState) then) =
      _$DraftsListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFetching, bool fetched, List<Article> data, String? errorMsg});
}

/// @nodoc
class _$DraftsListStateCopyWithImpl<$Res>
    implements $DraftsListStateCopyWith<$Res> {
  _$DraftsListStateCopyWithImpl(this._value, this._then);

  final DraftsListState _value;
  // ignore: unused_field
  final $Res Function(DraftsListState) _then;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? fetched = freezed,
    Object? data = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      fetched: fetched == freezed
          ? _value.fetched
          : fetched // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DraftsListStateCopyWith<$Res>
    implements $DraftsListStateCopyWith<$Res> {
  factory _$DraftsListStateCopyWith(
          _DraftsListState value, $Res Function(_DraftsListState) then) =
      __$DraftsListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isFetching, bool fetched, List<Article> data, String? errorMsg});
}

/// @nodoc
class __$DraftsListStateCopyWithImpl<$Res>
    extends _$DraftsListStateCopyWithImpl<$Res>
    implements _$DraftsListStateCopyWith<$Res> {
  __$DraftsListStateCopyWithImpl(
      _DraftsListState _value, $Res Function(_DraftsListState) _then)
      : super(_value, (v) => _then(v as _DraftsListState));

  @override
  _DraftsListState get _value => super._value as _DraftsListState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? fetched = freezed,
    Object? data = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_DraftsListState(
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      fetched: fetched == freezed
          ? _value.fetched
          : fetched // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DraftsListState implements _DraftsListState {
  _$_DraftsListState(
      {this.isFetching = false,
      this.fetched = false,
      this.data = const [],
      this.errorMsg});

  factory _$_DraftsListState.fromJson(Map<String, dynamic> json) =>
      _$_$_DraftsListStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
  @JsonKey(defaultValue: false)
  @override
  final bool fetched;
  @JsonKey(defaultValue: const [])
  @override
  final List<Article> data;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'DraftsListState(isFetching: $isFetching, fetched: $fetched, data: $data, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DraftsListState &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)) &&
            (identical(other.fetched, fetched) ||
                const DeepCollectionEquality()
                    .equals(other.fetched, fetched)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.errorMsg, errorMsg) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsg, errorMsg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isFetching) ^
      const DeepCollectionEquality().hash(fetched) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(errorMsg);

  @JsonKey(ignore: true)
  @override
  _$DraftsListStateCopyWith<_DraftsListState> get copyWith =>
      __$DraftsListStateCopyWithImpl<_DraftsListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DraftsListStateToJson(this);
  }
}

abstract class _DraftsListState implements DraftsListState {
  factory _DraftsListState(
      {bool isFetching,
      bool fetched,
      List<Article> data,
      String? errorMsg}) = _$_DraftsListState;

  factory _DraftsListState.fromJson(Map<String, dynamic> json) =
      _$_DraftsListState.fromJson;

  @override
  bool get isFetching => throw _privateConstructorUsedError;
  @override
  bool get fetched => throw _privateConstructorUsedError;
  @override
  List<Article> get data => throw _privateConstructorUsedError;
  @override
  String? get errorMsg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DraftsListStateCopyWith<_DraftsListState> get copyWith =>
      throw _privateConstructorUsedError;
}
