import 'package:flutter/material.dart';
import 'package:solmusic/Pages/Views/DateDropdownButton.dart';
import 'package:solmusic/Pages/Views/TimeDropdownButton.dart';
import 'package:solmusic/Style/Style.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
class BookingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookingPageState();
  }
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();

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
                  width: 200,
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
                  width: 200,
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
            ),SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      Text(
                        "Number of people",
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
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Center(
                    child: TextField(
                      maxLines: 1,
                      controller: numberOfPeopleController,
                      decoration: InputDecoration.collapsed(
                          hintText: 'Number of people'),
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
                  width: 200,
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
                  width: 200,
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
                  width: 200,
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
              onTap: () {
                launchEmailSubmission();
              },
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

  void launchEmailSubmission() async {
    if (emailController.text.isEmpty) {
      // TODO: show alert
      return;
    }
    print('launchEmailSubmission');
    // final Uri params = Uri(
    //     scheme: 'mailto',
    //     path: 'myOwnEmailAddress@gmail.com',
    //     queryParameters: {
    //       'subject': 'Default Subject',
    //       'body': 'Default body'
    //     }
    // );
    // String url = params.toString();
    // if (await canLaunchUrl(params)) {
    //   await launchUrl(params);
    // } else {
    //   print('Could not launch $url');
    // }
    String emailTo = Uri.encodeComponent("mail@fluttercampus.com");
    String emailCC = '';
    String emailSubject = Uri.encodeComponent("Table reservation");
    String emailBody = Uri.encodeComponent("Email: ${emailController.text}. Number of people: ${numberOfPeopleController.text}. Note: ${noteController.text}");
    Uri mail = Uri.parse("mailto:$emailTo?subject=$emailSubject&body=$emailBody");
    if (!isWebMobile()) {
      mail = Uri.parse(buildEmailUrl(emailTo: emailTo, emailCC: emailCC, emailSubject: emailSubject, emailBody: emailBody));
    } else {
      // do nothing
    }
    if (await canLaunchUrl(mail)) {
      await launchUrl(mail);
      //email app opened
    }else{
      //email app is not opened
    }

  }

  String buildEmailUrl({
    required String emailTo,
    required String emailCC,
    required String emailSubject,
    required String emailBody,
  }) {
    final baseUrl = "https://mail.google.com/mail?view=cm&tf=0";
    final params = <String, String>{};

    if (emailTo.isNotEmpty) params['to'] = emailTo;
    if (emailCC.isNotEmpty) params['cc'] = emailCC;
    if (emailSubject.isNotEmpty) params['su'] = emailSubject;
    if (emailBody.isNotEmpty) params['body'] = emailBody;

    final query = Uri(queryParameters: params).query;
    final newUrl = '$baseUrl$query';

    return newUrl;
  }

  bool isWebMobile() {
    final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.linux);
    print("kIsWeb = $kIsWeb");
    print("defaultTargetPlatform = $defaultTargetPlatform");

    print("isWebMobile = $isWebMobile");
    return isWebMobile;
  }
}