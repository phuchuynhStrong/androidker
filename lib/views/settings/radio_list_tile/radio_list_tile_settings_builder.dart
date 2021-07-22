import 'package:androiker/views/settings/radio_list_tile/radio_list_tile_settings.dart';
import 'package:androiker/views/settings/settings_enum.dart';
import 'package:androiker/views/settings/settings_item_data.dart';
import 'package:flutter/material.dart';

typedef SettingsWidgetBuilder = Function(SettingsItemData);

class RadioListTileSettingBuilder {
  final SettingsItemData? data;

  RadioListTileSettingBuilder(this.data);

  static final Map<Type, SettingsWidgetBuilder> _builderMaps = {
    DarkModeSettingEnum: (data) => RadioListTileSetting<DarkModeSettingEnum>(
          data: data as RatioSettingItemData<DarkModeSettingEnum>,
        ),
    TextSizeSettingEnum: (data) => RadioListTileSetting<TextSizeSettingEnum>(
          data: data as RatioSettingItemData<TextSizeSettingEnum>,
        ),
  };

  Widget build() {
    final builder = _builderMaps[data!.id];
    if (builder == null || data == null) {
      return const SizedBox();
    }
    return builder(data!);
  }
}
