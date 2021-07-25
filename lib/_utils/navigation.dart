import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationUtils {
  static Future<void> openUrl(String? url) async {
    if (url == null) {
      return;
    }

    return canLaunch(url).then((value) {
      if (value) {
        launch(url);
      }
    }).catchError((error) {
      Logger().e("Can't launch URL: $error");
    });
  }
}
