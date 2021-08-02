import 'package:androiker/_utils/logger.dart';
import 'package:androiker/di/component/app_component.dart';
import 'package:androiker/di/component/article_component.dart';
import 'package:androiker/di/component/auth_component.dart';
import 'package:androiker/di/module/app_module.dart';
import 'package:androiker/di/module/app_settings.dart';
import 'package:androiker/di/module/article_module.dart';
import 'package:androiker/di/module/auth_module.dart';
import 'package:androiker/routing/app_route_parser.dart';
import 'package:androiker/routing/app_router.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:androiker/themes.dart';
import 'package:authentication/di/user_provider.dart';
import 'package:authentication/model/signin_request.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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

    final FirebaseService firebaseService = FirebaseFactory.create();

    // Reemove leading hash (#) from web URl
    setPathUrlStrategy();
    // Get SharedPreferences instance and inject into App
    final sharedPrefs = await SharedPreferences.getInstance();
    // Initialize AppComponent
    final appComponent = AppComponent(
      appModule: AppModule(
        sharedPreferences: sharedPrefs,
      ),
    );

    final articleComponent = ArticleComponent(
      module: ArticleModule(
        firestore: firebaseService.firestore,
        logger: Logger(),
      ),
    );

    final authComponent = AuthComponent(
      authModule: AuthModule(
        firebaseAuth: firebaseService.firebaseAuth,
        logger: Logger(),
      ),
    );

    final appSettings = AppSettings(
      sharedPreferences: sharedPrefs,
    );

    final UserProvider userProvider = UserProvider();

    runApp(
      MultiProvider(
        providers: [
          Provider<AppComponent>(create: (_) => appComponent),
          Provider<ArticleComponent>(create: (_) => articleComponent),
          Provider<AuthComponent>(create: (_) => authComponent),
          ChangeNotifierProvider<AppSettings>(create: (_) => appSettings),
          ChangeNotifierProvider<UserProvider>(create: (_) => userProvider),
        ],
        child: _AndroidkerApp(
          appComponent: appComponent,
          appSettings: appSettings,
          userProvider: userProvider,
        ),
      ),
    );
  });
}

class _AndroidkerApp extends StatefulWidget {
  final AppComponent? appComponent;
  final AppSettings? appSettings;
  final UserProvider? userProvider;
  const _AndroidkerApp({
    Key? key,
    this.appComponent,
    this.appSettings,
    this.userProvider,
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
    router = AppRouterDelegate(routingBloc, userProvider: widget.userProvider);
    updateSystemBrightness(WidgetsBinding.instance!.window.platformBrightness);
    WidgetsBinding.instance!.window.onPlatformBrightnessChanged = () {
      updateSystemBrightness(
          WidgetsBinding.instance!.window.platformBrightness);
    };
    super.initState();
  }

  void updateSystemBrightness(Brightness brightness) {
    widget.appSettings?.brightness = brightness;
  }

  @override
  Widget build(BuildContext context) {
    AppTheme appSettings =
        context.select((AppSettings settings) => settings.theme);
    double textScaleFactor =
        context.select((AppSettings settings) => settings.textScaleFactor);
    return BlocProvider(
      create: (context) => routingBloc,
      child: MaterialApp.router(
        title: "Androidker Folio",
        color: appSettings.primary,
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouteParser,
        routerDelegate: router,
        theme: appSettings.toThemeData(),
        builder: (context, child) {
          final data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: textScaleFactor,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
