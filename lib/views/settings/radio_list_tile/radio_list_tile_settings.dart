import 'package:androiker/_utils/enum.dart';
import 'package:androiker/views/settings/settings_item_data.dart';
import 'package:flutter/material.dart';

import '../../../core_packages.dart';

class RadioListTileSetting<T> extends StatefulWidget {
  final RatioSettingItemData<T>? data;
  const RadioListTileSetting({Key? key, this.data}) : super(key: key);

  @override
  _RadioListTileSettingState<T> createState() =>
      _RadioListTileSettingState<T>();
}

class _RadioListTileSettingState<T> extends State<RadioListTileSetting<T>> {
  T? _current;

  @override
  Widget build(BuildContext context) {
    final values = widget.data?.values;
    if (values == null || values.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        Expanded(
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: values.length,
              itemBuilder: (context, pos) {
                final value = values[pos];
                return RadioListTile<T>(
                  contentPadding: EdgeInsets.only(
                    right: Insets.lg,
                  ),
                  selected: _current == value,
                  activeColor: Colors.white,
                  title: Text(
                    EnumUtils.getCapitalizedEnumName(value.toString()) ?? "-",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  value: value,
                  groupValue: _current,
                  onChanged: (val) {
                    setState(() {
                      _current = val;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
