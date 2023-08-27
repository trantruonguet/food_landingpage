import 'package:flutter/material.dart';
import 'package:solmusic/Style/Style.dart';

class NavigationBarItem extends StatefulWidget {
  @override
  _NavigationBarItemState createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1200) {
          return DesktopNavBar();
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth <= 1200) {
          return DesktopNavBar();
        } else {
          return MobileNavBar();
        }
      },
    );
  }
}

class DesktopNavBar extends StatefulWidget {
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
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Home", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Text("Book", style: ThemText.navBarWhiteTab),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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
            // Flexible(
            //   flex: 3,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Container(
            //         child: Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(2.0),
            //               child: Text("Help", style: ThemText.helpGreyText),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Container(
            //                   width: 0.75, height: 16, color: Colors.white),
            //             ),
            //             TextButton(
            //               onPressed: () {},
            //               child: Padding(
            //                 padding: const EdgeInsets.all(2.0),
            //                 child:
            //                     Text("Login", style: ThemText.loginWhiteText),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           "Create an account",
            //           style: ThemText.createAccountPinkText,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
