import 'package:androiker/resources/resources.dart';
import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';

const kComingSoonPageId = 'coming_soon';

final kComingSoonContentMarginTop = EdgeInsets.only(
  top: Insets.scale * 96,
);
final kComingSoonContentPadding = EdgeInsets.only(
  top: Insets.scale * 96,
  bottom: Insets.scale * 48,
);

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.testBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Insets.xl,
        ),
        child: Column(
          children: <Widget>[
            const HomeNavBar(
              email: "phuchuynh.strong@gmail.com",
            ),
            Container(
              margin: kComingSoonContentMarginTop,
              child: SingleChildScrollView(
                padding: kComingSoonContentPadding,
                child: RichText(
                  text: TextSpan(
                    text: "COMING SOON",
                    style: GoogleFonts.montserrat(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
