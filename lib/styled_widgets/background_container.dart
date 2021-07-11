import 'package:androiker/resources/resources.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget? child;
  const BackgroundContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.background),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: child ?? const SizedBox(),
    );
  }
}
