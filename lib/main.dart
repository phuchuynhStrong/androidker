import 'package:androiker/_utils/logger.dart';
import 'package:androiker/resources/resources.dart';
import 'package:androiker/services/firebase/firebase_service.dart';
import 'package:androiker/views/home_page/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  initLogger(() async {
    // TODO: Why we have to use this ?
    // Status bar style on Android/iOS
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());

    if (kIsWeb) {
      // Increase Skia cache size to support bigger images.
      const int megabyte = 1000000;
      SystemChannels.skia
          .invokeMethod('Skia.setResourceCacheMaxBytes', 512 * megabyte);
      // TODO: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
      await Future<void>.delayed(Duration.zero);
    }

    FirebaseService service = FirebaseFactory.create();

    runApp(_AndroidkerApp());
  });
}

class _AndroidkerApp extends StatefulWidget {
  const _AndroidkerApp({Key? key}) : super(key: key);

  @override
  _AndroidkerAppState createState() => _AndroidkerAppState();
}

class _AndroidkerAppState extends State<_AndroidkerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
