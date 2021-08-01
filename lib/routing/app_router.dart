import 'dart:async';

import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_page.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:androiker/routing/bloc/routing_state.dart';
import 'package:androiker/views/blog/blog_page.dart';
import 'package:androiker/views/editor/editor_page.dart';
import 'package:androiker/views/home_page/home_page.dart';
import 'package:androiker/views/not_found/page_not_found.dart';
import 'package:androiker/views/settings/settings_page.dart';
import 'package:androiker/views/signin/signin_page.dart';
import 'package:androiker/views/splash/splash_page.dart';
import 'package:authentication/di/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AppRouterDelegate extends RouterDelegate<AppLink> with ChangeNotifier {
  final RoutingBloc routingBloc;
  final UserProvider? userProvider;
  late final StreamSubscription<RoutingState> _routingChangeSub;

  AppRouterDelegate(
    this.routingBloc, {
    this.userProvider,
  }) {
    _routingChangeSub = routingBloc.stream.listen((event) {
      notifyListeners();
    });
    userProvider?.addListener(onUserChanged);
  }

  void onUserChanged() {}

  @override
  void dispose() {
    _routingChangeSub.cancel();
    userProvider?.removeListener(onUserChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().getUser();
    final pageEnum = currentConfiguration?.getAppPageEnum();
    final pageId = currentConfiguration?.pageId;
    final pageNotFound = isPageNotFound(pageId);
    final showBlog = pageEnum == AppPage.blog;
    final showHome = pageEnum == AppPage.home;
    final showSplash = pageEnum == AppPage.splash;
    final showSettings = pageEnum == AppPage.settings;
    final showEditor = pageEnum == AppPage.editor;
    final showSignIn = pageEnum == AppPage.signIn;
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
        if (showEditor) ...[
          const EditorPage(),
        ],
        if (showSignIn) ...[
          const SignInScreen(),
        ],
        if (showSettings) ...[
          const SettingsPage(),
        ],
        if (pageNotFound) ...[
          const PageNotFound(),
        ],
      ].map((e) => _wrapContentInPage(e)).toList(),
    );
  }

  bool tryGoBack() {
    Logger().i("Try go back");
    if (currentConfiguration?.appPage != AppPage.splash) {
      routingBloc.navigate(AppLink(pageId: AppPage.home.name));
      return true;
    }
    return false;
  }

  // This is only triggered from back button in Android (maybe iOS)
  // Back/Forward in Web doesn't count.
  @override
  Future<bool> popRoute() async {
    return SynchronousFuture(tryGoBack());
  }

  // Handle Navigator.pop for any routes in our stack.
  bool _handleNavigatorPop(Route<dynamic> route, dynamic result) {
    // Ask the route if it can handle pop internally...
    if (route.didPop(result)) {
      return tryGoBack();
    }
    return false;
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
