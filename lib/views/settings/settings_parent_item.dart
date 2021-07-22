import 'package:androiker/core_packages.dart';
import 'package:androiker/views/settings/settings_enum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingParentItem extends StatelessWidget {
  final SettingsEnum? item;
  final VoidCallback? onPressed;
  const SettingParentItem({Key? key, this.item, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemData = item?.data(context);
    if (itemData == null || itemData.isInvalid()) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: Corners.mdBorder,
        ),
        color: Colors.white70,
        child: Container(
          padding: EdgeInsets.all(Insets.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: Insets.lg,
                    ),
                    child: FaIcon(
                      itemData.iconData ?? FontAwesomeIcons.fontAwesome,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                  Text(
                    itemData.name ?? "",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 24.0 + Insets.lg,
                  top: Insets.sm,
                ),
                child: Text(
                  itemData.initialData ?? "-",
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
