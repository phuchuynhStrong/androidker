import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class AppMaterialPage<T> extends Page<T> {
  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  /// {@macro flutter.widgets.ModalRoute.maintainState}
  final bool maintainState;

  /// {@macro flutter.widgets.PageRoute.fullscreenDialog}
  final bool fullscreenDialog;

  const AppMaterialPage({
    required this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) : super(
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);
  @override
  Route<T> createRoute(BuildContext context) {
    return AppPageRoute<T>(page: this);
  }
}

class AppPageRoute<T> extends PageRoute<T> {
  AppPageRoute({
    required AppMaterialPage<T> page,
  }) : super(settings: page) {
    assert(opaque);
  }

  AppMaterialPage<T> get _page => settings as AppMaterialPage<T>;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    var begin = 0.0;
    var end = 1.0;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end);
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return FadeTransition(
      opacity: tween.animate(curvedAnimation),
      child: _page.child,
    );
  }

  @override
  bool get maintainState => _page.maintainState;

  @override
  bool get fullscreenDialog => _page.fullscreenDialog;

  @override
  Duration get transitionDuration => Times.fast;
}
