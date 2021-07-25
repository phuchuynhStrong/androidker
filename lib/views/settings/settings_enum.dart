import 'package:androiker/views/settings/settings_item_data.dart';
import 'package:androiker/views/settings/settings_item_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SettingsEnum {
  darkMode,
  textSize,
}

enum DarkModeSettingEnum {
  dark,
  light,
  system,
}

enum TextSizeSettingEnum {
  large,
  medium,
  small,
}

extension DisplaySettingsEnum on SettingsEnum {
  SettingsItemData? data(BuildContext context) {
    switch (this) {
      case SettingsEnum.darkMode:
        return RatioSettingItemData<DarkModeSettingEnum>(
          name: "Dark mode",
          iconData: FontAwesomeIcons.moon,
          initialData: "Dark",
          type: SettingsItemType.radioListTile,
          values: DarkModeSettingEnum.values,
        );
      case SettingsEnum.textSize:
        return RatioSettingItemData<TextSizeSettingEnum>(
          name: "Text size",
          iconData: FontAwesomeIcons.textHeight,
          initialData: "Medium",
          type: SettingsItemType.radioListTile,
          values: TextSizeSettingEnum.values,
        );
      default:
        return BlankSettingsItemData();
    }
  }
}
