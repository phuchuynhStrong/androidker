import 'package:androiker/views/settings/settings_item_type.dart';
import 'package:flutter/material.dart';

abstract class SettingsItemData<T> {
  final String? name;
  final IconData? iconData;
  final String? initialData;
  final SettingsItemType? type;
  late final Type? id;

  SettingsItemData({
    this.name,
    this.iconData,
    this.initialData,
    this.type,
  }) {
    id = T;
  }

  bool isInvalid() => name == null || iconData == null;
}

class BlankSettingsItemData<T> extends SettingsItemData {}

class RatioSettingItemData<T> extends SettingsItemData<T> {
  final List<T>? values;

  RatioSettingItemData({
    name,
    iconData,
    initialData,
    type,
    this.values,
  }) : super(
          name: name,
          iconData: iconData,
          initialData: initialData,
          type: type,
        );
}
