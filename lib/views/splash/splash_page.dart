import 'package:androiker/resources/resources.dart';
import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const kSplashScreenBgColor = Color(0xff181818);

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late RiveAnimationController _controller;

  @override
  void initState() {
    _controller = OneShotAnimation('Splash', autoplay: true, onStop: () {
      context.read<RoutingBloc>().navigate(
            AppLink(
              pageId: AppPage.home.name,
            ),
          );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(Images.background), context);
    precacheImage(const AssetImage(Images.coolerImage), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashScreenBgColor,
      body: Center(
        child: RiveAnimation.asset(
          Rives.androidkerSplash,
          fit: BoxFit.contain,
          controllers: [_controller],
        ),
      ),
    );
  }
}
