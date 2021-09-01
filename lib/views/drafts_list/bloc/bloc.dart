import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:articles/di/article_repository.dart';
import 'package:articles/model/article.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state.dart';

enum DraftsListEvent {
  fetch,
}

class DraftsListBloc extends Bloc<DraftsListEvent, DraftsListState> {
  final ArticleRepository? _articleRepository;
  DraftsListBloc({
    @required ArticleRepository? articleRepository,
  })  : _articleRepository = articleRepository,
        super(DraftsListState.initial()) {
    fetch();
  }

  void fetch() => add(DraftsListEvent.fetch);

  void onCreateDraft(BuildContext context) =>
      context.read<RoutingBloc>().navigate(AppLink(
            pageId: AppPage.editor.name,
          ));

  void onEditDraft(BuildContext context, Article article) =>
      context.read<RoutingBloc>().navigate(
            AppLink(
              pageId: AppPage.editor.name,
              articleId: article.id,
            ),
          );

  @override
  Stream<DraftsListState> mapEventToState(DraftsListEvent event) async* {
    switch (event) {
      case DraftsListEvent.fetch:
        yield state.copyWith.call(
          isFetching: true,
        );
        final nextState = await _articleRepository
            ?.getArticles(
              articleType: ArticleType.draft,
            )
            .then((value) => state.copyWith.call(
                  isFetching: false,
                  fetched: true,
                  data: value?.data ?? <Article>[],
                ))
            .catchError(
              (error) => state.copyWith.call(
                isFetching: false,
                errorMsg: error.toString(),
              ),
            );
        yield nextState!;
        break;
      default:
    }
  }
}
