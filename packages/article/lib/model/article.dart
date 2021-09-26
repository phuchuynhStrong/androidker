import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    final String? id,
    final String? title,
    final String? cover,
    final String? thumbnail,
    final String? content,
    final String? author,
    final DateTime? createdAt,
    @Default(false) final bool isDraft,
  }) = _Article;
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
