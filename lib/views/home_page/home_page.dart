import 'package:androiker/core_packages.dart';
import 'package:androiker/routing/cubit/routing_cubit.dart';
import 'package:androiker/views/cv/cv_viewer.dart';
import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../styles.dart';

const kHomePageId = '';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Insets.xl,
          ),
          child: Column(
            children: const <Widget>[
              HomeNavBar(
                email: "phuchuynh.strong@gmail.com",
              ),
              HomeContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

final kHomeContentPadding = EdgeInsets.only(
  top: Insets.scale * 96,
  bottom: Insets.scale * 48,
);
final kHomeContentMarginTop = EdgeInsets.only(
  top: Insets.scale * 96,
);

class HomeContentTitleWidget extends StatelessWidget {
  const HomeContentTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Hi,\n",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              const TextSpan(
                text: "I'm ",
              ),
              TextSpan(
                text: "Phuc Huynh",
                style: GoogleFonts.montserrat(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: "",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: "Mobile Developer",
                style: GoogleFonts.montserrat(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HomeContentSubtitleAndButton extends StatelessWidget {
  const HomeContentSubtitleAndButton({Key? key}) : super(key: key);

  void onShowCvPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const FullScreenDialog(child: AppCvViewer());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: Insets.lg,
          ),
          child: Text(
            "Expert on",
            style: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: Insets.lg,
          ),
          child: Text(
            "Based in Vietnam\nI'm software engineer and \nspecialize in mobile development.",
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.4,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: Insets.lg,
          ),
          child: Text(
            "Hey are you looking for developer to build and grow your business? let's shake hand with me.",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white60,
              letterSpacing: 1.1,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onShowCvPressed(context);
          },
          child: RichText(
              text: TextSpan(
            text: "The CV ",
            style: GoogleFonts.montserrat(
              color: Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
            children: const [
              WidgetSpan(
                child: FaIcon(
                  FontAwesomeIcons.download,
                  size: 14,
                  color: Colors.red,
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}

final kHomePrimaryButtonpadding = MaterialStateProperty.resolveWith(
    (states) => EdgeInsets.all(Insets.scale * 20));
final kHomePrimaryButtonColor =
    MaterialStateProperty.resolveWith((states) => Colors.red);
final kHomePrimaryButtonShape =
    MaterialStateProperty.all<RoundedRectangleBorder>(
  const RoundedRectangleBorder(
    borderRadius: Corners.mdBorder,
  ),
);
final kHomePrimaryButtonTextMargin = EdgeInsets.only(
  right: Insets.xl,
);

class HomePrimaryButtons extends StatelessWidget {
  const HomePrimaryButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<RoutingCubit>().blog();
          },
          style: ButtonStyle(
            backgroundColor: kHomePrimaryButtonColor,
            padding: kHomePrimaryButtonpadding,
            shape: kHomePrimaryButtonShape,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: kHomePrimaryButtonTextMargin,
                child: Text(
                  "Blogs",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.blog,
                size: 15,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          height: 16.0,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: kHomePrimaryButtonColor,
            padding: kHomePrimaryButtonpadding,
            shape: kHomePrimaryButtonShape,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: kHomePrimaryButtonTextMargin,
                child: Text(
                  "Showcase",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.planeArrival,
                size: 15,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: kHomeContentMarginTop,
        child: SingleChildScrollView(
          padding: kHomeContentPadding,
          child: Wrap(
            spacing: Insets.scale * 48,
            runSpacing: Insets.xl,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const HomeContentTitleWidget(),
              const HomeContentSubtitleAndButton(),
              // Always have a new line of widget
              Container(width: double.infinity),
              const HomePrimaryButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
