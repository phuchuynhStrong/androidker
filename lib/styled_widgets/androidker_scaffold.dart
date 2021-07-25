import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:androiker/views/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

import '../core_packages.dart';

class AndroidkerScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? drawer;
  final Widget? customAppBarLeading;

  final String? windowTitleText;
  final Color? windowTitleColor;
  const AndroidkerScaffold({
    Key? key,
    @required this.body,
    this.drawer,
    this.windowTitleText,
    this.windowTitleColor,
    this.customAppBarLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer ?? const AndroidkerSidebar(),
      body: Title(
        color: windowTitleColor ?? Colors.black,
        title: windowTitleText ?? "Androidker Folio",
        child: BackgroundContainer(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.xl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HomeNavBar(
                  email: "phuchuynh.strong@gmail.com",
                  leading: customAppBarLeading,
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
