import 'package:androiker/resources/resources.dart';
import 'package:androiker/views/home_page/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.testBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 48.0,
        ),
        child: Container(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              HomeNavBar(
                name: "Phuc Huynh",
                email: "phuchuynh.strong@gmail.com",
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 96,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(
                        //   top: 96,
                        // ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            top: 96,
                            bottom: 48.0,
                          ),
                          child: Wrap(
                            spacing: 48.0,
                            runSpacing: 32.0,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              Container(
                                child: Column(
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
                                          TextSpan(
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
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 16.0,
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
                                      bottom: 16.0,
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
                                      bottom: 48.0,
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
                                    onPressed: () {},
                                    child: RichText(
                                        text: TextSpan(
                                      text: "Download CV ",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.1,
                                      ),
                                      children: [
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
                              ),
                              Container(
                                width: double.infinity,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.red),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                        (states) => EdgeInsets.all(20.0),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 32.0,
                                          ),
                                          child: Text(
                                            "Blogs",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        FaIcon(
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
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) => Colors.red),
                                      padding:
                                          MaterialStateProperty.resolveWith(
                                        (states) => EdgeInsets.all(20.0),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            right: 32.0,
                                          ),
                                          child: Text(
                                            "Showcase",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.planeArrival,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
