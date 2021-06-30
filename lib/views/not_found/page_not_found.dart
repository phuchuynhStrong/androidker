import 'package:androiker/resources/resources.dart';
import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

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
          children: const <Widget>[
            HomeNavBar(
              name: "Phuc Huynh",
              email: "phuchuynh.strong@gmail.com",
            ),
          ],
        ),
      ),
    );
  }
}
