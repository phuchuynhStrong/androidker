// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'article_pagination_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticlePaginationResponse _$ArticlePaginationResponseFromJson(
    Map<String, dynamic> json) {
  return _ArticlePaginationResponse.fromJson(json);
}

/// @nodoc
class _$ArticlePaginationResponseTearOff {
  const _$ArticlePaginationResponseTearOff();

  _ArticlePaginationResponse call({List<Article> data = const []}) {
    return _ArticlePaginationResponse(
      data: data,
    );
  }

  ArticlePaginationResponse fromJson(Map<String, Object> json) {
    return ArticlePaginationResponse.fromJson(json);
  }
}

/// @nodoc
const $ArticlePaginationResponse = _$ArticlePaginationResponseTearOff();

/// @nodoc
mixin _$ArticlePaginationResponse {
  List<Article> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlePaginationResponseCopyWith<ArticlePaginationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlePaginationResponseCopyWith<$Res> {
  factory $ArticlePaginationResponseCopyWith(ArticlePaginationResponse value,
          $Res Function(ArticlePaginationResponse) then) =
      _$ArticlePaginationResponseCopyWithImpl<$Res>;
  $Res call({List<Article> data});
}

/// @nodoc
class _$ArticlePaginationResponseCopyWithImpl<$Res>
    implements $ArticlePaginationResponseCopyWith<$Res> {
  _$ArticlePaginationResponseCopyWithImpl(this._value, this._then);

  final ArticlePaginationResponse _value;
  // ignore: unused_field
  final $Res Function(ArticlePaginationResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
abstract class _$ArticlePaginationResponseCopyWith<$Res>
    implements $ArticlePaginationResponseCopyWith<$Res> {
  factory _$ArticlePaginationResponseCopyWith(_ArticlePaginationResponse value,
          $Res Function(_ArticlePaginationResponse) then) =
      __$ArticlePaginationResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Article> data});
}

/// @nodoc
class __$ArticlePaginationResponseCopyWithImpl<$Res>
    extends _$ArticlePaginationResponseCopyWithImpl<$Res>
    implements _$ArticlePaginationResponseCopyWith<$Res> {
  __$ArticlePaginationResponseCopyWithImpl(_ArticlePaginationResponse _value,
      $Res Function(_ArticlePaginationResponse) _then)
      : super(_value, (v) => _then(v as _ArticlePaginationResponse));

  @override
  _ArticlePaginationResponse get _value =>
      super._value as _ArticlePaginationResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_ArticlePaginationResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticlePaginationResponse implements _ArticlePaginationResponse {
  _$_ArticlePaginationResponse({this.data = const []});

  factory _$_ArticlePaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ArticlePaginationResponseFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<Article> data;

  @override
  String toString() {
    return 'ArticlePaginationResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ArticlePaginationResponse &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$ArticlePaginationResponseCopyWith<_ArticlePaginationResponse>
      get copyWith =>
          __$ArticlePaginationResponseCopyWithImpl<_ArticlePaginationResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ArticlePaginationResponseToJson(this);
  }
}

abstract class _ArticlePaginationResponse implements ArticlePaginationResponse {
  factory _ArticlePaginationResponse({List<Article> data}) =
      _$_ArticlePaginationResponse;

  factory _ArticlePaginationResponse.fromJson(Map<String, dynamic> json) =
      _$_ArticlePaginationResponse.fromJson;

  @override
  List<Article> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArticlePaginationResponseCopyWith<_ArticlePaginationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
