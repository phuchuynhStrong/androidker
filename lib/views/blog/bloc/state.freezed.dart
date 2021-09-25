// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogPageState _$BlogPageStateFromJson(Map<String, dynamic> json) {
  return _BlogPageState.fromJson(json);
}

/// @nodoc
class _$BlogPageStateTearOff {
  const _$BlogPageStateTearOff();

  _BlogPageState call(
      {bool isFetching = false,
      bool fetched = false,
      List<Article> data = const [],
      String? errorMsg}) {
    return _BlogPageState(
      isFetching: isFetching,
      fetched: fetched,
      data: data,
      errorMsg: errorMsg,
    );
  }

  BlogPageState fromJson(Map<String, Object> json) {
    return BlogPageState.fromJson(json);
  }
}

/// @nodoc
const $BlogPageState = _$BlogPageStateTearOff();

/// @nodoc
mixin _$BlogPageState {
  bool get isFetching => throw _privateConstructorUsedError;
  bool get fetched => throw _privateConstructorUsedError;
  List<Article> get data => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogPageStateCopyWith<BlogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPageStateCopyWith<$Res> {
  factory $BlogPageStateCopyWith(
          BlogPageState value, $Res Function(BlogPageState) then) =
      _$BlogPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isFetching, bool fetched, List<Article> data, String? errorMsg});
}

/// @nodoc
class _$BlogPageStateCopyWithImpl<$Res>
    implements $BlogPageStateCopyWith<$Res> {
  _$BlogPageStateCopyWithImpl(this._value, this._then);

  final BlogPageState _value;
  // ignore: unused_field
  final $Res Function(BlogPageState) _then;

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
abstract class _$BlogPageStateCopyWith<$Res>
    implements $BlogPageStateCopyWith<$Res> {
  factory _$BlogPageStateCopyWith(
          _BlogPageState value, $Res Function(_BlogPageState) then) =
      __$BlogPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isFetching, bool fetched, List<Article> data, String? errorMsg});
}

/// @nodoc
class __$BlogPageStateCopyWithImpl<$Res>
    extends _$BlogPageStateCopyWithImpl<$Res>
    implements _$BlogPageStateCopyWith<$Res> {
  __$BlogPageStateCopyWithImpl(
      _BlogPageState _value, $Res Function(_BlogPageState) _then)
      : super(_value, (v) => _then(v as _BlogPageState));

  @override
  _BlogPageState get _value => super._value as _BlogPageState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? fetched = freezed,
    Object? data = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_BlogPageState(
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
class _$_BlogPageState implements _BlogPageState {
  _$_BlogPageState(
      {this.isFetching = false,
      this.fetched = false,
      this.data = const [],
      this.errorMsg});

  factory _$_BlogPageState.fromJson(Map<String, dynamic> json) =>
      _$_$_BlogPageStateFromJson(json);

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
    return 'BlogPageState(isFetching: $isFetching, fetched: $fetched, data: $data, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlogPageState &&
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
  _$BlogPageStateCopyWith<_BlogPageState> get copyWith =>
      __$BlogPageStateCopyWithImpl<_BlogPageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BlogPageStateToJson(this);
  }
}

abstract class _BlogPageState implements BlogPageState {
  factory _BlogPageState(
      {bool isFetching,
      bool fetched,
      List<Article> data,
      String? errorMsg}) = _$_BlogPageState;

  factory _BlogPageState.fromJson(Map<String, dynamic> json) =
      _$_BlogPageState.fromJson;

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
  _$BlogPageStateCopyWith<_BlogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleBlogPageState _$SingleBlogPageStateFromJson(Map<String, dynamic> json) {
  return _SingleBlogPageState.fromJson(json);
}

/// @nodoc
class _$SingleBlogPageStateTearOff {
  const _$SingleBlogPageStateTearOff();

  _SingleBlogPageState call(
      {bool isFetching = false,
      bool fetched = false,
      Article? data,
      String? errorMsg}) {
    return _SingleBlogPageState(
      isFetching: isFetching,
      fetched: fetched,
      data: data,
      errorMsg: errorMsg,
    );
  }

  SingleBlogPageState fromJson(Map<String, Object> json) {
    return SingleBlogPageState.fromJson(json);
  }
}

/// @nodoc
const $SingleBlogPageState = _$SingleBlogPageStateTearOff();

/// @nodoc
mixin _$SingleBlogPageState {
  bool get isFetching => throw _privateConstructorUsedError;
  bool get fetched => throw _privateConstructorUsedError;
  Article? get data => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleBlogPageStateCopyWith<SingleBlogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleBlogPageStateCopyWith<$Res> {
  factory $SingleBlogPageStateCopyWith(
          SingleBlogPageState value, $Res Function(SingleBlogPageState) then) =
      _$SingleBlogPageStateCopyWithImpl<$Res>;
  $Res call({bool isFetching, bool fetched, Article? data, String? errorMsg});

  $ArticleCopyWith<$Res>? get data;
}

/// @nodoc
class _$SingleBlogPageStateCopyWithImpl<$Res>
    implements $SingleBlogPageStateCopyWith<$Res> {
  _$SingleBlogPageStateCopyWithImpl(this._value, this._then);

  final SingleBlogPageState _value;
  // ignore: unused_field
  final $Res Function(SingleBlogPageState) _then;

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
abstract class _$SingleBlogPageStateCopyWith<$Res>
    implements $SingleBlogPageStateCopyWith<$Res> {
  factory _$SingleBlogPageStateCopyWith(_SingleBlogPageState value,
          $Res Function(_SingleBlogPageState) then) =
      __$SingleBlogPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isFetching, bool fetched, Article? data, String? errorMsg});

  @override
  $ArticleCopyWith<$Res>? get data;
}

/// @nodoc
class __$SingleBlogPageStateCopyWithImpl<$Res>
    extends _$SingleBlogPageStateCopyWithImpl<$Res>
    implements _$SingleBlogPageStateCopyWith<$Res> {
  __$SingleBlogPageStateCopyWithImpl(
      _SingleBlogPageState _value, $Res Function(_SingleBlogPageState) _then)
      : super(_value, (v) => _then(v as _SingleBlogPageState));

  @override
  _SingleBlogPageState get _value => super._value as _SingleBlogPageState;

  @override
  $Res call({
    Object? isFetching = freezed,
    Object? fetched = freezed,
    Object? data = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_SingleBlogPageState(
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
class _$_SingleBlogPageState implements _SingleBlogPageState {
  _$_SingleBlogPageState(
      {this.isFetching = false,
      this.fetched = false,
      this.data,
      this.errorMsg});

  factory _$_SingleBlogPageState.fromJson(Map<String, dynamic> json) =>
      _$_$_SingleBlogPageStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
  @JsonKey(defaultValue: false)
  @override
  final bool fetched;
  @override
  final Article? data;
  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'SingleBlogPageState(isFetching: $isFetching, fetched: $fetched, data: $data, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SingleBlogPageState &&
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
  _$SingleBlogPageStateCopyWith<_SingleBlogPageState> get copyWith =>
      __$SingleBlogPageStateCopyWithImpl<_SingleBlogPageState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SingleBlogPageStateToJson(this);
  }
}

abstract class _SingleBlogPageState implements SingleBlogPageState {
  factory _SingleBlogPageState(
      {bool isFetching,
      bool fetched,
      Article? data,
      String? errorMsg}) = _$_SingleBlogPageState;

  factory _SingleBlogPageState.fromJson(Map<String, dynamic> json) =
      _$_SingleBlogPageState.fromJson;

  @override
  bool get isFetching => throw _privateConstructorUsedError;
  @override
  bool get fetched => throw _privateConstructorUsedError;
  @override
  Article? get data => throw _privateConstructorUsedError;
  @override
  String? get errorMsg => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SingleBlogPageStateCopyWith<_SingleBlogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
