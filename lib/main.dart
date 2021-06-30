import 'package:androiker/_utils/logger.dart';
import 'package:androiker/routing/app_route_parser.dart';
import 'package:androiker/routing/app_router.dart';
import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routing/cubit/routing_cubit.dart';

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

    runApp(const _AndroidkerApp());
  });
}

class _AndroidkerApp extends StatefulWidget {
  const _AndroidkerApp({Key? key}) : super(key: key);

  @override
  _AndroidkerAppState createState() => _AndroidkerAppState();
}

class _AndroidkerAppState extends State<_AndroidkerApp> {
  AppRouteParser appRouteParser = AppRouteParser();
  late AppRouterDelegate router;
  late RoutingCubit routingCubit;

  @override
  void initState() {
    routingCubit = RoutingCubit();
    router = AppRouterDelegate(routingCubit)
      ..setInitialRoutePath(routingCubit.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => routingCubit,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouteParser,
        routerDelegate: router,
      ),
    );
  }
}
