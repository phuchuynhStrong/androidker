import 'package:androiker/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sized_context/sized_context.dart';

class HomeNavBar extends StatelessWidget {
  final String? name;
  final String? email;

  const HomeNavBar({Key? key, this.name, this.email}) : super(key: key);

  void openUrl(String? url) {
    if (url == null) {
      return;
    }

    canLaunch(url).then((value) {
      if (value) {
        launch(url);
      }
    }).catchError((error) {
      Logger().e("Can't launch URL: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    bool useVerticalLayout = context.widthPx < 700;
    return Container(
      padding: EdgeInsets.only(
        top: Insets.lg,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: Insets.xl,
            ),
            child: Text(
              name ?? "-",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            email ?? "-",
            style: GoogleFonts.montserrat(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Expanded(child: Container()),
          if (!useVerticalLayout) ...[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook),
              iconSize: IconSizes.med,
              color: Colors.white,
              onPressed: () =>
                  openUrl("https://www.facebook.com/phuc.huynh.280896/"),
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              iconSize: IconSizes.med,
              color: Colors.white,
              onPressed: () {
                openUrl("https://www.linkedin.com/in/phuchuynhstrong/");
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              color: Colors.white,
              iconSize: IconSizes.med,
              onPressed: () {
                openUrl("https://github.com/phuchuynhStrong");
              },
            ),
          ] else
            const Icon(
              Icons.menu,
              size: IconSizes.med,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
