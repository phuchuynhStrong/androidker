import 'package:androiker/core_packages.dart';
import 'package:androiker/views/settings/settings_enum.dart';
import 'package:androiker/views/settings/settings_parent_item.dart';
import 'package:androiker/views/settings/sub_setting/sub_setting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsEnum? _opened;

  void _onItemPress({SettingsEnum? value}) {
    if (_opened == value) {
      setState(() {
        _opened = null;
      });
    } else {
      setState(() {
        _opened = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AndroidkerScaffold(
      customAppBarLeading: !kIsWeb
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: FaIcon(
                FontAwesomeIcons.caretLeft,
                color: theme.colorScheme.onPrimary,
              ),
            )
          : null,
      body: Expanded(
        child: AnimatedSwitcher(
          duration: Times.fast,
          child: _opened != null
              ? SubSetting(
                  onBackPressed: () => _onItemPress(),
                  data: _opened?.data(context),
                )
              : SizedBox(
                  width: context.widthPx,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: Insets.xl,
                          bottom: Insets.sm,
                        ),
                        child: Text(
                          "Settings",
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: Insets.lg,
                        ),
                        child: Text(
                          "Customize your settings on Androidker's Folio",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color:
                                theme.colorScheme.onBackground.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            ...SettingsEnum.values
                                .map(
                                  (val) => SettingParentItem(
                                    item: val,
                                    onPressed: () => _onItemPress(value: val),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
