import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  final Widget? child;
  const FullScreenDialog({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStyledDialog(
      bgColor: Colors.black38,
      child: SizedBox(
        width: context.widthPx,
        height: context.heightPx,
        child: child ?? Container(),
      ),
    );
  }
}
