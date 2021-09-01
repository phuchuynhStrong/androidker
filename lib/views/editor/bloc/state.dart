import 'package:androiker/views/editor/bloc/bloc.dart';
import 'package:articles/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
class EditorPageState with _$EditorPageState {
  factory EditorPageState({
    @Default(false) final bool isExecuting,
    @Default(false) final bool executed,
    @Default(EditorPageEvent.none) final EditorPageEvent action,
    final Article? data,
    final String? errorMsg,
  }) = _EditorPageState;
  factory EditorPageState.fromJson(Map<String, dynamic> json) =>
      _$EditorPageStateFromJson(json);
  factory EditorPageState.initial() => EditorPageState.fromJson({});
}
