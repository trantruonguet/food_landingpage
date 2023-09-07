import 'package:flutter/material.dart';
import 'package:solmusic/Style/Style.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      var size = MediaQuery.of(context).size;
      return Container(
        width: size.width,
        child: Container(
          height: size.height,
          width: size.width,
          color: Color(0xff0A183D),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Open Hours",
                    style: ThemText.footerText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        footerText("Monday"),
                        footerText("Tuesday"),
                        footerText("Wednesday"),
                        footerText("Thursday"),
                        footerText("Friday"),
                        footerText("Saturday"),
                        footerText("Sunday"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        footerText("10:30-23:30"),
                        footerText("10:30-23:30"),
                        footerText("10:30-23:30"),
                        footerText("10:30-23:30"),
                        footerText("10:30-23:30"),
                        footerText("10:30-23:30"),
                        footerText("Closed"),
                      ],
                    ),
                    Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        footerText("Address"),
                        footerText("Contact Us"),
                        footerText("Email"),
                        footerText("Terms of Use"),
                        footerText("Page"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        footerText("14 Floor, Berlin Centre, Berlin, Germany"),
                        footerText("+84123456789"),
                        footerText("sol_restaurent@gmail.com"),
                        footerText("Privacy"),
                        Image.asset(
                          "images/icfb1.png",
                          height: 20,
                          width: 20,
                        ),
                        // footerText("Contact Us"),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Sol Restaurent",
                    style: ThemText.footerText,
                  ),
                ),
                Center(
                  child: Text(
                    "© Created By Sol Restaurent",
                    style: ThemText.footerText.copyWith(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget footerText(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: ThemText.footerText,
      ),
    );
  }
}
