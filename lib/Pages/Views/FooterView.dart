import 'package:flutter/cupertino.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';

import '../../Style/Style.dart';

class FooterView extends StatelessWidget {
  final Size size;
  final FirestoreData? data;

  const FooterView({super.key, required this.size, this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: size.height * 0.80,
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
                    ...data?.openHours?.map((e) => footerText(e)) ?? [],
                    // footerText("12:00-22:30"),
                    // footerText("12:00-22:30"),
                    // footerText("12:00-22:30"),
                    // footerText("12:00-22:30"),
                    // footerText("12:00-22:30"),
                    // footerText("12:00-22:30"),
                    // footerText("Closed"),
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
                    // footerText("SolMusic Originals"),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    footerText(
                        data?.address ?? ""),
                    footerText(data?.phoneNumber ?? ""),
                    footerText(data?.email ?? ""),
                    footerText("Privacy"),
                    // footerText("Contact Us"),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                data?.restaurantName ?? "" ,
                style: ThemText.footerText,
              ),
            ),
            Center(
              child: Text(
                "© Created By ${ data?.restaurantName ?? "" }",
                style: ThemText.footerText,
              ),
            )
          ],
        ),
      ),
    );
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