// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticlePaginationResponse _$_$_ArticlePaginationResponseFromJson(
    Map<String, dynamic> json) {
  return _$_ArticlePaginationResponse(
    data: (json['data'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_ArticlePaginationResponseToJson(
        _$_ArticlePaginationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
