import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Pages/Landing/LandingDesktopView.dart';
import 'package:solmusic/Pages/Landing/LandingMobileView.dart';

class LandingPage extends StatefulWidget {
  final FirestoreData? data;

  const LandingPage({super.key, this.data});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          //For Desktop Screen
          return LandingDesktopView(data: widget.data);
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth <= 1200) {
          //for Tablet Screen
          return LandingDesktopView(data: widget.data);
        } else {
          //for mobile Screen
          return LandingMobileView(data: widget.data);
        }
      },
    );
  }
}
