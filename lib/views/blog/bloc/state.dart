import 'package:articles/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class BlogPageState with _$BlogPageState {
  factory BlogPageState({
    @Default(false) final bool isFetching,
    @Default(false) final bool fetched,
    @Default([]) final List<Article> data,
    final String? errorMsg,
  }) = _BlogPageState;
  factory BlogPageState.fromJson(Map<String, dynamic> json) =>
      _$BlogPageStateFromJson(json);
  factory BlogPageState.initial() => BlogPageState.fromJson({});
}
