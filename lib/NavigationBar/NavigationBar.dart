import 'package:flutter/material.dart';
import 'package:solmusic/Style/Style.dart';

// ignore: must_be_immutable
class NavigationBarItem extends StatefulWidget {
  NavigationBarItem({
    required this.onLandingPagePress,
    required this.onMenuPagePress,
    required this.onBookPagePress,
    required this.onContactPagePress,
  });

  Function onLandingPagePress;
  Function onMenuPagePress;
  Function onBookPagePress;
  Function onContactPagePress;

  @override
  _NavigationBarItemState createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopNavBar(
            onLandingPagePress: widget.onLandingPagePress,
            onMenuPagePress: widget.onMenuPagePress,
            onBookPagePress: widget.onBookPagePress,
            onContactPagePress: widget.onContactPagePress,
          );
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth <= 1200) {
          return DesktopNavBar(
            onLandingPagePress: widget.onLandingPagePress,
            onMenuPagePress: widget.onMenuPagePress,
            onBookPagePress: widget.onBookPagePress,
            onContactPagePress: widget.onContactPagePress,
          );
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

// ignore: must_be_immutable
class DesktopNavBar extends StatefulWidget {
  DesktopNavBar({
    required this.onLandingPagePress,
    required this.onMenuPagePress,
    required this.onBookPagePress,
    required this.onContactPagePress,
  });

  Function onLandingPagePress;
  Function onMenuPagePress;
  Function onBookPagePress;
  Function onContactPagePress;

  @override
  _DesktopNavBarState createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Color(0xff08192D),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Sol".toUpperCase(),
                        style: ThemText.titlePinkText,
                      ),
                      Text("Restaurent".toUpperCase(),
                          style: ThemText.titleWhiteText)
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onLandingPagePress();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Home", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onMenuPagePress();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Menu", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onBookPagePress();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Book", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.onContactPagePress();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Contact", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Mobile NavBar

class MobileNavBar extends StatefulWidget {
  @override
  _MobileNavBarState createState() => _MobileNavBarState();
}

class _MobileNavBarState extends State<MobileNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
