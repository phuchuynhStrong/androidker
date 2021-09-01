import 'package:articles/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class DraftsListState with _$DraftsListState {
  factory DraftsListState({
    @Default(false) final bool isFetching,
    @Default(false) final bool fetched,
    @Default([]) final List<Article> data,
    final String? errorMsg,
  }) = _DraftsListState;
  factory DraftsListState.fromJson(Map<String, dynamic> json) =>
      _$DraftsListStateFromJson(json);
  factory DraftsListState.initial() => DraftsListState.fromJson({});
}
