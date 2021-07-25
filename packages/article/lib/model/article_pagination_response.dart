import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart';

part 'article_pagination_response.freezed.dart';
part 'article_pagination_response.g.dart';

@freezed
class ArticlePaginationResponse with _$ArticlePaginationResponse {
  factory ArticlePaginationResponse({
    @Default([]) final List<Article> data,
  }) = _ArticlePaginationResponse;
  factory ArticlePaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlePaginationResponseFromJson(json);
}
