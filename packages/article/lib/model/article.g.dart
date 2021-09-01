// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$_$_ArticleFromJson(Map<String, dynamic> json) {
  return _$_Article(
    id: json['id'] as String?,
    title: json['title'] as String?,
    cover: json['cover'] as String?,
    thumbnail: json['thumbnail'] as String?,
    content: json['content'] as String?,
    author: json['author'] as String?,
    isDraft: json['isDraft'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
      'thumbnail': instance.thumbnail,
      'content': instance.content,
      'author': instance.author,
      'isDraft': instance.isDraft,
    };
