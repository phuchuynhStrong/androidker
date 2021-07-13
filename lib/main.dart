import 'package:androiker/_utils/logger.dart';
import 'package:androiker/di/component/app_component.dart';
import 'package:androiker/di/module/app_module.dart';
import 'package:androiker/routing/app_route_parser.dart';
import 'package:androiker/routing/app_router.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  initLogger(() async {
    // TODO: Why we have to use this ?
    // Status bar style on Android/iOS
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());

    if (kIsWeb) {
      // Increase Skia cache size to support bigger images.
      const int megabyte = 1000000;
      SystemChannels.skia
          .invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
      // TODO: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
      await Future<void>.delayed(Duration.zero);
    }

    FirebaseFactory.create();

    // Reemove leading hash (#) from web URl
    setPathUrlStrategy();
    // Get SharedPreferences instance and inject into App
    final sharedPrefs = await SharedPreferences.getInstance();
    // Initialize AppComponent
    final appComponent = AppComponent(
        appModule: AppModule(
      sharedPreferences: sharedPrefs,
    ));

    runApp(_AndroidkerApp(
      appComponent: appComponent,
    ));
  });
}

class _AndroidkerApp extends StatefulWidget {
  final AppComponent? appComponent;
  const _AndroidkerApp({
    Key? key,
    this.appComponent,
  }) : super(key: key);

  @override
  _AndroidkerAppState createState() => _AndroidkerAppState();
}

class _AndroidkerAppState extends State<_AndroidkerApp> {
  AppRouteParser appRouteParser = AppRouteParser();
  late AppRouterDelegate router;
  late RoutingBloc routingBloc;

  @override
  void initState() {
    routingBloc = RoutingBloc(
      sharedPreferences: widget.appComponent?.appModule?.sharedPreferences,
    );
    router = AppRouterDelegate(routingBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AppComponent?>(
      create: (_) => widget.appComponent,
      child: BlocProvider(
        create: (context) => routingBloc,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: appRouteParser,
          routerDelegate: router,
        ),
      ),
    );
  }
}
