// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogPageState _$_$_BlogPageStateFromJson(Map<String, dynamic> json) {
  return _$_BlogPageState(
    isFetching: json['isFetching'] as bool? ?? false,
    fetched: json['fetched'] as bool? ?? false,
    data: (json['data'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    errorMsg: json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$_$_BlogPageStateToJson(_$_BlogPageState instance) =>
    <String, dynamic>{
      'isFetching': instance.isFetching,
      'fetched': instance.fetched,
      'data': instance.data,
      'errorMsg': instance.errorMsg,
    };

_$_SingleBlogPageState _$_$_SingleBlogPageStateFromJson(
    Map<String, dynamic> json) {
  return _$_SingleBlogPageState(
    isFetching: json['isFetching'] as bool? ?? false,
    fetched: json['fetched'] as bool? ?? false,
    data: json['data'] == null
        ? null
        : Article.fromJson(json['data'] as Map<String, dynamic>),
    errorMsg: json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$_$_SingleBlogPageStateToJson(
        _$_SingleBlogPageState instance) =>
    <String, dynamic>{
      'isFetching': instance.isFetching,
      'fetched': instance.fetched,
      'data': instance.data,
      'errorMsg': instance.errorMsg,
    };
