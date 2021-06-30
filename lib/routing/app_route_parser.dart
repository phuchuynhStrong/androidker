import 'package:androiker/routing/app_link.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteParser extends RouteInformationParser<AppLink> {
  @override
  Future<AppLink> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(AppLink.fromLocation(routeInformation.location));
  }

  @override
  RouteInformation restoreRouteInformation(AppLink configuration) {
    return RouteInformation(location: configuration.toLocation());
  }
}
