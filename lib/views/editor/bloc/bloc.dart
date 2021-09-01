import 'package:articles/di/article_repository.dart';
import 'package:articles/model/article.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

import 'state.dart';

class FetchAction extends EditorPageAction {
  final String? id;

  FetchAction(this.id) : super(EditorPageEvent.fetch);
}

class SaveAction extends EditorPageAction {
  final Article? data;

  SaveAction(this.data) : super(EditorPageEvent.update);
}

class PublishAction extends EditorPageAction {
  final String? id;

  PublishAction(this.id) : super(EditorPageEvent.publish);
}

abstract class EditorPageAction {
  final EditorPageEvent type;

  EditorPageAction(this.type);
}

enum EditorPageEvent {
  fetch,
  update,
  create,
  publish,
  none,
}

class EditorPageBloc extends Bloc<EditorPageAction, EditorPageState> {
  final String? id;
  final ArticleRepository? _articleRepository;
  EditorPageBloc({this.id, ArticleRepository? articleRepository})
      : assert(articleRepository != null),
        _articleRepository = articleRepository,
        super(EditorPageState.initial()) {
    fetchDraft();
  }

  void fetchDraft() {
    if (id != null) {
      add(FetchAction(id));
    }
  }

  void saveArticle(Article data) {
    add(SaveAction(data));
  }

  void publishArticle(String? id) {
    if (id != null) {
      add(PublishAction(id));
    }
  }

  bool isSaving() =>
      state.isExecuting &&
      (state.action == EditorPageEvent.update ||
          state.action == EditorPageEvent.create);

  @override
  Stream<EditorPageState> mapEventToState(EditorPageAction event) async* {
    switch (event.type) {
      case EditorPageEvent.create:
        break;
      case EditorPageEvent.publish:
        final id = (event as PublishAction).id;
        yield state.copyWith.call(
          isExecuting: true,
          action: event.type,
        );
        final nextState = await _articleRepository
            ?.publishArticle(id)
            .then(
              (value) => state.copyWith.call(
                isExecuting: false,
                executed: value,
                action: EditorPageEvent.none,
              ),
            )
            .catchError(
          (error) {
            return state.copyWith.call(
              isExecuting: false,
              action: EditorPageEvent.none,
              errorMsg: error.toString(),
            );
          },
        );
        if (nextState != null) {
          yield nextState;
        }
        break;
      case EditorPageEvent.update:
        final data = event as SaveAction;
        yield state.copyWith.call(
          isExecuting: true,
          action: event.type,
        );
        final nextState = await _articleRepository
            ?.saveArticle(data.data!)
            .then((value) => state.copyWith.call(
                  isExecuting: false,
                  data: value,
                  action: EditorPageEvent.none,
                  executed: true,
                ))
            .catchError((error) => state.copyWith.call(
                  isExecuting: false,
                  errorMsg: error.toString(),
                  action: EditorPageEvent.none,
                ));
        if (nextState != null) {
          yield nextState;
        }
        break;
      case EditorPageEvent.fetch:
        yield state.copyWith.call(
          isExecuting: true,
          action: event.type,
        );
        final nextState = await _articleRepository
            ?.getArticle(id, articleType: ArticleType.draft)
            .then((value) => state.copyWith.call(
                  isExecuting: false,
                  data: value,
                  action: EditorPageEvent.none,
                  executed: true,
                ))
            .catchError((error) => state.copyWith.call(
                  isExecuting: false,
                  errorMsg: error.toString(),
                  action: EditorPageEvent.none,
                ));
        Logger().i(nextState);
        if (nextState != null) {
          yield nextState;
        }
        break;
      default:
    }
  }
}
