import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class SidebarSectionDivider extends StatelessWidget {
  const SidebarSectionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Insets.xl,
      ),
      height: 1.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
