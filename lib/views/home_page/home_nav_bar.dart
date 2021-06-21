import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.0,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 48,
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
          IconButton(
            icon: FaIcon(FontAwesomeIcons.facebook),
            onPressed: () {
              openUrl("https://www.facebook.com/phuc.huynh.280896/");
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.linkedin),
            onPressed: () {
              openUrl("https://www.linkedin.com/in/phuchuynhstrong/");
            },
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.github),
            onPressed: () {
              openUrl("https://github.com/phuchuynhStrong");
            },
          ),
          Icon(
            Icons.menu,
            size: 16,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
