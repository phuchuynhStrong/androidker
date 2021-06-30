import 'package:androiker/routing/app_link.dart';
import 'package:flutter/material.dart';

class AppRouteInformationProvider extends RouteInformationProvider {
  final AppLink appLink;

  AppRouteInformationProvider(this.appLink);
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  RouteInformation get value =>
      RouteInformation(location: appLink.toLocation());
}
