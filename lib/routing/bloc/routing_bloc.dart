import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoutingEvent {
  final AppLink appLink;

  RoutingEvent(this.appLink);
}

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  final SharedPreferences? _sharedPreferences;
  RoutingBloc({
    @required SharedPreferences? sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        super(
          RoutingState.initial().copyWith.call(
                isSplashScreenOver:
                    sharedPreferences?.getBool('splash') ?? false,
              ),
        );

  void navigate(AppLink appLink) => add(RoutingEvent(appLink));

  bool _needToUpdateRouter(AppLink event) {
    final current = AppLink.fromLocation(state.location);
    return current.pageId == "" ||
        event.pageId != current.pageId ||
        event.articleId != current.articleId;
  }

  @override
  Stream<RoutingState> mapEventToState(RoutingEvent event) async* {
    final needUpdateRouter = _needToUpdateRouter(event.appLink);

    if (!needUpdateRouter) {
      yield state;
    }

    if (needUpdateRouter) {
      var pageId = event.appLink.pageId;
      AppLink nextLink = AppLink(
        pageId: pageId,
        articleId: event.appLink.articleId,
      );
      final pageEnum = nextLink.getAppPageEnum();
      switch (pageEnum) {
        case AppPage.splash:
          if (state.isSplashScreenOver) {
            nextLink = AppLink(
              pageId: AppPage.home.name,
            );
            yield state.copyWith.call(
              location: nextLink.toRawLocation(),
            );
          }

          if (!state.isSplashScreenOver) {
            _sharedPreferences?.setBool('splash', true);
            yield state.copyWith.call(
              isSplashScreenOver: true,
              location: nextLink.toRawLocation(),
            );
          }
          break;
        default:
          yield state.copyWith.call(
            location: nextLink.toRawLocation(),
          );
          break;
      }
    }
  }
}
