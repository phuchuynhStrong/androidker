// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AndroidkerUser _$AndroidkerUserFromJson(Map<String, dynamic> json) {
  return _AndroidkerUser.fromJson(json);
}

/// @nodoc
class _$AndroidkerUserTearOff {
  const _$AndroidkerUserTearOff();

  _AndroidkerUser call(
      {String? id, String? email, String? displayName, String? photoUrl}) {
    return _AndroidkerUser(
      id: id,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
    );
  }

  AndroidkerUser fromJson(Map<String, Object> json) {
    return AndroidkerUser.fromJson(json);
  }
}

/// @nodoc
const $AndroidkerUser = _$AndroidkerUserTearOff();

/// @nodoc
mixin _$AndroidkerUser {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidkerUserCopyWith<AndroidkerUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidkerUserCopyWith<$Res> {
  factory $AndroidkerUserCopyWith(
          AndroidkerUser value, $Res Function(AndroidkerUser) then) =
      _$AndroidkerUserCopyWithImpl<$Res>;
  $Res call({String? id, String? email, String? displayName, String? photoUrl});
}

/// @nodoc
class _$AndroidkerUserCopyWithImpl<$Res>
    implements $AndroidkerUserCopyWith<$Res> {
  _$AndroidkerUserCopyWithImpl(this._value, this._then);

  final AndroidkerUser _value;
  // ignore: unused_field
  final $Res Function(AndroidkerUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AndroidkerUserCopyWith<$Res>
    implements $AndroidkerUserCopyWith<$Res> {
  factory _$AndroidkerUserCopyWith(
          _AndroidkerUser value, $Res Function(_AndroidkerUser) then) =
      __$AndroidkerUserCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? email, String? displayName, String? photoUrl});
}

/// @nodoc
class __$AndroidkerUserCopyWithImpl<$Res>
    extends _$AndroidkerUserCopyWithImpl<$Res>
    implements _$AndroidkerUserCopyWith<$Res> {
  __$AndroidkerUserCopyWithImpl(
      _AndroidkerUser _value, $Res Function(_AndroidkerUser) _then)
      : super(_value, (v) => _then(v as _AndroidkerUser));

  @override
  _AndroidkerUser get _value => super._value as _AndroidkerUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_AndroidkerUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AndroidkerUser implements _AndroidkerUser {
  _$_AndroidkerUser({this.id, this.email, this.displayName, this.photoUrl});

  factory _$_AndroidkerUser.fromJson(Map<String, dynamic> json) =>
      _$_$_AndroidkerUserFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'AndroidkerUser(id: $id, email: $email, displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AndroidkerUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoUrl);

  @JsonKey(ignore: true)
  @override
  _$AndroidkerUserCopyWith<_AndroidkerUser> get copyWith =>
      __$AndroidkerUserCopyWithImpl<_AndroidkerUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AndroidkerUserToJson(this);
  }
}

abstract class _AndroidkerUser implements AndroidkerUser {
  factory _AndroidkerUser(
      {String? id,
      String? email,
      String? displayName,
      String? photoUrl}) = _$_AndroidkerUser;

  factory _AndroidkerUser.fromJson(Map<String, dynamic> json) =
      _$_AndroidkerUser.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AndroidkerUserCopyWith<_AndroidkerUser> get copyWith =>
      throw _privateConstructorUsedError;
}
