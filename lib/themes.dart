import 'package:androiker/views/settings/settings_enum.dart';
import 'package:flutter/material.dart';

/// Inspired from Flutter-Folio

enum ThemeType {
  menInBlack,
  menInWhite,
}

class AppTheme {
  static const ThemeType defaultTheme = ThemeType.menInBlack;
  static const Color _lightPrimaryColor = Color(0xfff8f8ff);

  final ThemeType? themeType;
  final DarkModeSettingEnum? darkMode;

  final Color? primary;
  final Color? secondary;
  final Color? background;
  final Color? surface;
  final Color? error;

  final Color? onPrimary;
  final Color? onSecondary;
  final Color? onBackground;
  final Color? onSurface;
  final Color? onError;

  AppTheme({
    this.themeType,
    this.darkMode,
    this.primary,
    this.secondary,
    this.background,
    this.surface,
    this.onPrimary,
    this.onSecondary,
    this.onBackground,
    this.onSurface,
    this.error,
    this.onError,
  });

  factory AppTheme.fromType(ThemeType type) {
    switch (type) {
      case ThemeType.menInBlack:
        return AppTheme(
          themeType: type,
          darkMode: DarkModeSettingEnum.dark,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.red,
          onSecondary: Colors.white,
          background: const Color(0xff181818),
          onBackground: Colors.white,
          surface: Colors.white70,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white70,
        );
      case ThemeType.menInWhite:
        return AppTheme(
          themeType: type,
          darkMode: DarkModeSettingEnum.light,
          primary: _lightPrimaryColor,
          onPrimary: Colors.black,
          secondary: Colors.red,
          onSecondary: Colors.black,
          background: _lightPrimaryColor,
          onBackground: Colors.black,
          surface: Colors.black87,
          onSurface: _lightPrimaryColor,
          error: Colors.red,
          onError: _lightPrimaryColor,
        );
      default:
        return AppTheme.fromType(defaultTheme);
    }
  }

  ThemeData toThemeData() {
    return ThemeData.from(
      colorScheme: ColorScheme(
        primary: primary!,
        primaryVariant: shift(primary!, .1),
        secondary: secondary!,
        secondaryVariant: shift(secondary!, .1),
        surface: surface!,
        background: background!,
        error: error!,
        onPrimary: onPrimary!,
        onSecondary: onSecondary!,
        onSurface: onSurface!,
        onBackground: onBackground!,
        onError: onError!,
        brightness: themeType == ThemeType.menInBlack
            ? Brightness.dark
            : Brightness.light,
      ),
      textTheme: (themeType == ThemeType.menInBlack
              ? ThemeData.dark()
              : ThemeData.light())
          .textTheme,
    );
  }

  /// This will add luminance in dark mode, and remove it in light.
  // Allows the view to just make something "stronger" or "weaker" without worrying what the current theme brightness is
  //      color = theme.shift(someColor, .1); //-10% lum in dark mode, +10% in light mode
  Color shift(Color c, double amt) {
    amt *= (themeType == ThemeType.menInBlack ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness =
        (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }
}
