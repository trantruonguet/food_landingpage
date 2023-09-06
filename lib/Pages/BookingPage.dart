import 'package:flutter/material.dart';
import 'package:solmusic/Pages/Views/DateDropdownButton.dart';
import 'package:solmusic/Pages/Views/TimeDropdownButton.dart';
import 'package:solmusic/Style/Style.dart';

class BookingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      var size = MediaQuery.of(context).size;
      return Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 180.0),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "TABLE RESERVATION",
              style: ThemText.bigTextTitle.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Row(
                    children: [
                      Text(
                        "Email",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "* :",
                        style: ThemText.bigTextTitle
                            .copyWith(color: Colors.red)
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  height: 40,
                  width: 400,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Enter your email'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Row(
                    children: [
                      Text(
                        "Date",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "* :",
                        style: ThemText.bigTextTitle
                            .copyWith(color: Colors.red)
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                DateDropdownButton(),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Row(
                    children: [
                      Text(
                        "Time",
                        style: ThemText.bigTextTitle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "* :",
                        style: ThemText.bigTextTitle
                            .copyWith(color: Colors.red)
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                TimeDropdownButton(),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    "Note for us:",
                    style: ThemText.bigTextTitle.copyWith(fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  height: 100,
                  width: 400,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: TextField(
                    maxLines: 5,
                    controller: noteController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Writing your comments"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
                "Table is kept for 15 minutes after reservation time. \nWe appreciate you being on time."),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xffFC0254),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Center(
                  child: Text(
                    "Booking",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
