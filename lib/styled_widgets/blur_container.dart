import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget? child;
  const BlurContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: child ?? Container(),
    );
  }
}
