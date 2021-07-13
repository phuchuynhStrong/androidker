import 'dart:async';

import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_page.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:androiker/routing/bloc/routing_state.dart';
import 'package:androiker/views/blog/blog_page.dart';
import 'package:androiker/views/home_page/home_page.dart';
import 'package:androiker/views/not_found/page_not_found.dart';
import 'package:androiker/views/splash/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppRouterDelegate extends RouterDelegate<AppLink> with ChangeNotifier {
  final RoutingBloc routingBloc;
  late final StreamSubscription<RoutingState> _routingChangeSub;

  AppRouterDelegate(this.routingBloc) {
    _routingChangeSub = routingBloc.stream.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _routingChangeSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageEnum = currentConfiguration?.getAppPageEnum();
    final pageId = currentConfiguration?.pageId;
    final pageNotFound = isPageNotFound(pageId);
    final showBlog = pageEnum == AppPage.blog;
    final showHome = pageEnum == AppPage.home;
    final showSplash = pageEnum == AppPage.splash;
    return Navigator(
      onPopPage: _handleNavigatorPop,
      pages: [
        if (showSplash) ...[
          const SplashPage(),
        ],
        if (showHome) ...[
          const HomePage(),
        ],
        if (showBlog) ...[
          const BlogPage(),
        ],
        if (pageNotFound) ...[
          const PageNotFound(),
        ],
      ].map((e) => _wrapContentInPage(e)).toList(),
    );
  }

  @override
  Future<bool> popRoute() async {
    return false;
  }

  // Handle Navigator.pop for any routes in our stack
  bool _handleNavigatorPop(Route<dynamic> route, dynamic result) {
    // Ask the route if it can handle pop internally...
    return route.didPop(result);
  }

  @override
  AppLink? get currentConfiguration {
    final appLink = AppLink.fromLocation(routingBloc.state.location);
    if (appLink.isInvalid()) {
      return AppLink.initial();
    }

    return appLink;
  }

  @override
  Future<void> setInitialRoutePath(AppLink configuration) {
    Logger().i("setInitialRoutePath - ${configuration.pageId}");
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    final location = configuration.toLocation();
    Logger().i(location);
    // In the worse case which configuration is invalid, route user
    // to home page
    if (configuration.isInvalid() && currentConfiguration != null) {
      routingBloc.navigate(AppLink.initial());
      return;
    }

    // Whenver the platform report a new route information, update
    // cubit with the new configuration
    routingBloc.navigate(configuration);
  }

  Page _wrapContentInPage(Widget e) {
    //On mobile, use the Material/Cupertino transitions
    // if (DeviceInfo.isMobile) {
    return AppMaterialPage<void>(
      child: e,
      key: ValueKey(
        e.runtimeType.toString(),
      ),
    );
    // }
    // // On desktop, use no-transition as is typical
    // else {
    //   return NoAnimationPage(child: e, key: ValueKey(e.runtimeType));
    // }
  }
}
