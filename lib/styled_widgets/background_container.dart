import 'package:androiker/di/module/app_settings.dart';
import 'package:androiker/resources/resources.dart';
import 'package:androiker/themes.dart';
import 'package:flutter/material.dart';
import 'package:androiker/core_packages.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? child;
  const BackgroundContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme? appTheme =
        context.select((AppSettings settings) => settings.theme);

    if (appTheme?.themeType == ThemeType.menInWhite) {
      return _LightBackgroundContainer(
        child: child,
      );
    }

    return _DarkBackgroundContainer(
      child: child,
    );
  }
}

class _LightBackgroundContainer extends StatelessWidget {
  final Widget? child;
  const _LightBackgroundContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.lightBackground),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white38, BlendMode.darken),
        ),
      ),
      child: child ?? const SizedBox(),
    );
  }
}

class _DarkBackgroundContainer extends StatelessWidget {
  final Widget? child;
  const _DarkBackgroundContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.background),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
        // color: Color.fromRGBO(35, 35, 37, 1.0),
      ),
      child: child ?? const SizedBox(),
    );
  }
}
