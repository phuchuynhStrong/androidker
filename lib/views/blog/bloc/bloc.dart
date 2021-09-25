import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:articles/di/article_repository.dart';
import 'package:articles/model/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'state.dart';

enum BlogPageEvent {
  fetch,
  refresh,
  none,
}

class BlogPageBloc extends Bloc<BlogPageEvent, BlogPageState> {
  final ArticleRepository _articleRepository;

  BlogPageBloc({@required ArticleRepository? articleRepository})
      : assert(articleRepository != null),
        _articleRepository = articleRepository!,
        super(BlogPageState.initial()) {
    fetch();
  }

  void fetch() => add(BlogPageEvent.fetch);

  void onArticleItemPressed(BuildContext context, Article article) {
    context.read<RoutingBloc>().navigate(
          AppLink(
            pageId: AppPage.article.name,
            articleId: article.id,
          ),
        );
  }

  @override
  Stream<BlogPageState> mapEventToState(BlogPageEvent event) async* {
    switch (event) {
      case BlogPageEvent.fetch:
        yield state.copyWith.call(
          isFetching: true,
        );
        final nextState = await _articleRepository
            .getArticles()
            .then((value) => state.copyWith.call(
                  isFetching: false,
                  fetched: true,
                  data: value?.data ?? <Article>[],
                ))
            .catchError((error) => state.copyWith.call(
                  isFetching: false,
                  errorMsg: error.toString(),
                ));
        if (nextState.errorMsg != null) {
          Logger().e(nextState.errorMsg);
        }
        yield nextState;
        break;
      default:
    }
  }
}

enum SingleBlogPageEvent { fetch, none }

class SingleBlogPageBloc
    extends Bloc<SingleBlogPageEvent, SingleBlogPageState> {
  final String id;
  final ArticleRepository _articleRepository;
  SingleBlogPageBloc(
      {required this.id, @required ArticleRepository? articleRepository})
      : assert(articleRepository != null),
        _articleRepository = articleRepository!,
        super(SingleBlogPageState.initial()) {
    add(SingleBlogPageEvent.fetch);
  }

  @override
  Stream<SingleBlogPageState> mapEventToState(
      SingleBlogPageEvent event) async* {
    if (event == SingleBlogPageEvent.fetch) {
      yield state.copyWith.call(
        isFetching: true,
      );
      final nextState = await _articleRepository
          .getArticle(id)
          .then((value) => state.copyWith.call(
                isFetching: false,
                fetched: true,
                data: value,
              ))
          .catchError((error) => state.copyWith.call(
                isFetching: false,
                errorMsg: error.toString(),
              ));
      yield nextState;
    }
  }
}
