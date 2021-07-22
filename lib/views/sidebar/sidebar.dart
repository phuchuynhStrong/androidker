import 'package:androiker/_utils/layout.dart';
import 'package:androiker/_utils/navigation.dart';
import 'package:androiker/resources/resources.dart';
import 'package:androiker/styles.dart';
import 'package:androiker/views/sidebar/sidebar_settings_item.dart';
import 'package:flutter/material.dart';
import 'package:androiker/core_packages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const _kSidebarPercentWeb = 0.35;
const _kSidebarPecentMobile = 0.8;
const _kSidebarDarkBackgroundColor = Color(0xff1a1818);

class AndroidkerSidebar extends StatelessWidget {
  const AndroidkerSidebar({Key? key}) : super(key: key);

  void _closeSidebar(BuildContext context) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final useVerticalLayout = LayoutUtils.useVerticalLayout(context.widthPx);
    final sidebarWidth = context.widthPx *
        (useVerticalLayout ? _kSidebarPecentMobile : _kSidebarPercentWeb);
    return Container(
      width: sidebarWidth,
      padding: EdgeInsets.all(Insets.lg),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: Corners.mdBorder,
          color: _kSidebarDarkBackgroundColor,
        ),
        padding: EdgeInsets.all(Insets.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Insets.lg,
                bottom: Insets.lg,
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage(Images.coolerImage),
                radius: 24.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: Insets.sm,
              ),
              child: Text(
                "Phuc Huynh",
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "Androidker",
              style: GoogleFonts.montserrat(
                fontSize: 13,
                color: Colors.white60,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SidebarSectionDivider(),
            if (useVerticalLayout) ...[
              SidebarItem(
                prefix: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                  size: 16,
                ),
                title: "Facebook",
                onPressed: () {
                  NavigationUtils.openUrl(
                          "https://www.facebook.com/phuc.huynh.280896/")
                      .then(
                    (_) => _closeSidebar(context),
                  );
                },
              ),
              SidebarItem(
                prefix: const FaIcon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.white,
                  size: 16,
                ),
                title: "Linkedin",
                onPressed: () {
                  NavigationUtils.openUrl(
                          "https://www.linkedin.com/in/phuchuynhstrong/")
                      .then(
                    (_) => _closeSidebar(context),
                  );
                },
              ),
              SidebarItem(
                prefix: const FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.white,
                  size: 16,
                ),
                title: "Github",
                onPressed: () {
                  NavigationUtils.openUrl("https://github.com/phuchuynhStrong")
                      .then(
                    (_) => _closeSidebar(context),
                  );
                },
              ),
              const SidebarSectionDivider(),
            ],
            const SidebarSettingsItem(),
          ],
        ),
      ),
    );
  }
}
