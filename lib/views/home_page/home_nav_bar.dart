import 'package:androiker/_utils/layout.dart';
import 'package:androiker/_utils/navigation.dart';
import 'package:androiker/resources/resources.dart';
import 'package:androiker/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:androiker/core_packages.dart';

const _kLeadingMaxHeight = 48.0;
const _kSignatureIconSize = 48.0;

class HomeNavBar extends StatelessWidget {
  final String? email;
  final Widget? leading;

  const HomeNavBar({Key? key, this.email, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool useVerticalLayout = LayoutUtils.useVerticalLayout(context.widthPx);
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: Insets.lg,
      ),
      child: Row(
        children: [
          if (leading != null) ...[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: _kLeadingMaxHeight,
                child: leading!,
              ),
            ),
          ] else ...[
            // Androidker signature leading
            Container(
              margin: EdgeInsets.only(
                right: Insets.sm,
              ),
              child: SvgPicture.asset(
                Svgs.androidker,
                width: _kSignatureIconSize,
                height: _kSignatureIconSize,
                color: theme.colorScheme.onPrimary,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: Insets.sm,
              ),
              child: Text(
                "|",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
            Expanded(
              child: Text(
                email ?? "-",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],

          // Androidker signature leading
          if (!useVerticalLayout) ...[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook),
              iconSize: IconSizes.med,
              color: theme.colorScheme.onPrimary,
              onPressed: () => NavigationUtils.openUrl(
                  "https://www.facebook.com/phuc.huynh.280896/"),
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              iconSize: IconSizes.med,
              color: theme.colorScheme.onPrimary,
              onPressed: () {
                NavigationUtils.openUrl(
                    "https://www.linkedin.com/in/phuchuynhstrong/");
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              color: theme.colorScheme.onPrimary,
              iconSize: IconSizes.med,
              onPressed: () {
                NavigationUtils.openUrl("https://github.com/phuchuynhStrong");
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.cog),
              color: theme.colorScheme.onPrimary,
              iconSize: IconSizes.med,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ] else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: IconSizes.med,
                color: theme.colorScheme.onPrimary,
              ),
            ),
        ],
      ),
    );
  }
}
