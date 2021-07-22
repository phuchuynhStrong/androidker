import 'package:androiker/views/settings/radio_list_tile/radio_list_tile_settings_builder.dart';
import 'package:androiker/views/settings/settings_item_type.dart';
import 'package:flutter/material.dart';

import '../../../core_packages.dart';
import '../settings_item_data.dart';

class SubSetting extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final SettingsItemData? data;
  const SubSetting({Key? key, this.onBackPressed, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthPx,
      child: Padding(
        padding: EdgeInsets.only(
          top: Insets.xl,
          bottom: Insets.sm,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (kIsWeb)
              IconButton(
                padding: EdgeInsets.all(Insets.sm),
                onPressed: () {
                  onBackPressed?.call();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Insets.sm),
                    child: Text(
                      data?.name ?? "-",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SubSettingBuilder(
                      data: data,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubSettingBuilder extends StatelessWidget {
  final SettingsItemData? data;
  const SubSettingBuilder({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (data?.type) {
      case SettingsItemType.radioListTile:
        widget = RadioListTileSettingBuilder(data).build();
        break;
      default:
        widget = const SizedBox();
        break;
    }
    return widget;
  }
}
