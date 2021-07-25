import 'package:androiker/core_packages.dart';
import 'package:androiker/themes.dart';
import 'package:androiker/views/settings/settings_enum.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kSettingDarkModeKey = "dark_mode";
const _kSettingTextSizeKey = "text_size";

class AppSettings extends ChangeNotifier {
  static AppTheme get _defaultTheme => AppTheme.fromType(ThemeType.menInBlack);
  static double get _defaultTextScaleFactor => 1.0;
  late final SharedPreferences? _preferences;

  AppSettings({
    SharedPreferences? sharedPreferences,
  })  : assert(sharedPreferences != null),
        _preferences = sharedPreferences {
    darkModeSetting = EnumToString.fromString<DarkModeSettingEnum>(
            DarkModeSettingEnum.values,
            sharedPreferences?.getString(_kSettingDarkModeKey) ?? "") ??
        DarkModeSettingEnum.dark;
    textSizeSetting = EnumToString.fromString<TextSizeSettingEnum>(
            TextSizeSettingEnum.values,
            sharedPreferences?.getString(_kSettingTextSizeKey) ?? "") ??
        TextSizeSettingEnum.medium;
    if (darkModeSetting != null) {
      _theme =
          AppTheme.fromType(getThemeTypeWithDarkModeSetting(darkModeSetting!));
    }
  }

  /// Settings

  DarkModeSettingEnum? darkModeSetting;
  TextSizeSettingEnum? textSizeSetting;

  /// End of Settings

  late Brightness _platformBrightness;

  AppTheme _theme = _defaultTheme;
  AppTheme get theme => _theme;
  set theme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }

  double _textScaleFactor = _defaultTextScaleFactor;
  double get textScaleFactor => _textScaleFactor;
  set textScaleFactor(double factor) {
    _textScaleFactor = factor;
    notifyListeners();
  }

  set brightness(Brightness updatedBrightness) {
    _platformBrightness = updatedBrightness;
  }

  void handleSettingChanged(dynamic changedSetting) {
    Logger().i(changedSetting);
    switch (changedSetting.runtimeType) {
      case DarkModeSettingEnum:
        handleAppThemeChanged(changedSetting);
        break;
      case TextSizeSettingEnum:
        handleTextSizeChanged(changedSetting);
        break;
      default:
        break;
    }
  }

  T getCurrentSetting<T>() {
    switch (T) {
      case DarkModeSettingEnum:
        return darkModeSetting as T;
      case TextSizeSettingEnum:
        return textSizeSetting as T;
      default:
        // Well, still need to handle this
        return darkModeSetting as T;
    }
  }

  ThemeType getThemeTypeWithDarkModeSetting(
      DarkModeSettingEnum changedSetting) {
    ThemeType themeType;
    switch (changedSetting) {
      case DarkModeSettingEnum.dark:
        themeType = ThemeType.menInBlack;
        break;
      case DarkModeSettingEnum.light:
        themeType = ThemeType.menInWhite;
        break;
      default:
        if (_platformBrightness == Brightness.light) {
          themeType = ThemeType.menInWhite;
        } else {
          themeType = ThemeType.menInBlack;
        }

        break;
    }
    return themeType;
  }

  void handleAppThemeChanged(DarkModeSettingEnum changedSetting) {
    Logger().i(changedSetting);
    ThemeType themeType = getThemeTypeWithDarkModeSetting(changedSetting);
    darkModeSetting = changedSetting;
    theme = AppTheme.fromType(themeType);
    _preferences?.setString(
        _kSettingDarkModeKey, EnumToString.convertToString(changedSetting));
  }

  void handleTextSizeChanged(TextSizeSettingEnum changedSetting) {
    textSizeSetting = changedSetting;
    switch (changedSetting) {
      case TextSizeSettingEnum.large:
        textScaleFactor = 1.25;
        break;
      case TextSizeSettingEnum.small:
        textScaleFactor = 0.75;
        break;
      default:
        textScaleFactor = 1.0;
        break;
    }
    _preferences?.setString(
        _kSettingTextSizeKey, EnumToString.convertToString(changedSetting));
  }
}
