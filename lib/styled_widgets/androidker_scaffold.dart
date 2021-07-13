import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';

import '../core_packages.dart';

class AndroidkerScaffold extends StatelessWidget {
  final Widget? body;

  final String? windowTitleText;
  final Color? windowTitleColor;
  const AndroidkerScaffold({
    Key? key,
    this.body,
    this.windowTitleText,
    this.windowTitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Title(
        color: windowTitleColor ?? Colors.black,
        title: windowTitleText ?? "Androidker Folio",
        child: BackgroundContainer(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.xl,
            ),
            child: Column(
              children: <Widget>[
                const HomeNavBar(
                  email: "phuchuynh.strong@gmail.com",
                ),
                if (body != null) ...[body!]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
