import 'package:flutter/material.dart';
import 'package:solmusic/Style/Style.dart';

class BookingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Text("YOUR BOOKING"),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Text(
              "Email:",
              style: ThemText.bigTextTitle,
            ),
            Text(
              " *",
              style: ThemText.bigTextTitle.copyWith(color: Colors.red),
            ),
            SizedBox(
              width: 16,
            ),
            TextField(
              controller: emailController,
            ),
          ],
        )
      ]),
    );
  }
}
