import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class BaseStyledDialog extends StatelessWidget {
  final Color? bgColor;
  final EdgeInsets? padding;
  final Widget child;

  const BaseStyledDialog(
      {Key? key, required this.child, this.bgColor, this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: bgColor ?? Colors.black,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280),
        child: BlurContainer(
          child: Padding(
            padding: padding ?? EdgeInsets.symmetric(vertical: Insets.lg),
            child: child,
          ),
        ),
      ),
    );
  }
}
