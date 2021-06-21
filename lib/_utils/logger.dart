import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void initLogger(VoidCallback runApp) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      Logger().e(details.stack.toString());
    };
    runApp.call();
  }, (Object error, StackTrace stack) {
    Logger().e(stack.toString());
  });
}
