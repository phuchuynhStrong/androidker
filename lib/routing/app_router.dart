import 'dart:async';

import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/cubit/routing_cubit.dart';
import 'package:androiker/views/blog/blog_page.dart';
import 'package:androiker/views/home_page/home_page.dart';
import 'package:androiker/views/not_found/page_not_found.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppRouterDelegate extends RouterDelegate<AppLink> with ChangeNotifier {
  final RoutingCubit routingCubit;
  late final StreamSubscription<AppLink> _routingChangeSub;

  AppRouterDelegate(this.routingCubit) {
    _routingChangeSub = routingCubit.stream.listen((event) {
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
    final pageNotFound = currentConfiguration?.pageId == null ||
        currentConfiguration!.pageId!.isEmpty;
    final showBlog = currentConfiguration?.pageId == kBlogPageId;
    final showHome = currentConfiguration?.pageId == kHomePageId;
    return Navigator(
      onPopPage: _handleNavigatorPop,
      pages: [
        if (pageNotFound) ...[
          const PageNotFound(),
        ],
        if (showBlog) ...[
          const BlogPage(),
        ],
        if (showHome) ...[
          const HomePage(),
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
    return routingCubit.state;
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    final location = configuration.toLocation();
    Logger().i(location);
    if (configuration.isInvalid() && currentConfiguration != null) {
      routingCubit.emit(AppLink.initial());
    }
  }

  Page _wrapContentInPage(Widget e) {
    //On mobile, use the Material/Cupertino transitions
    // if (DeviceInfo.isMobile) {
    return MaterialPage<void>(child: e);
    // }
    // // On desktop, use no-transition as is typical
    // else {
    //   return NoAnimationPage(child: e, key: ValueKey(e.runtimeType));
    // }
  }
}
