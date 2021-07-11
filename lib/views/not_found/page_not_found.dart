import 'package:androiker/core_packages.dart';
import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.xl,
          ),
          child: Column(
            children: const <Widget>[
              HomeNavBar(
                email: "phuchuynh.strong@gmail.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
