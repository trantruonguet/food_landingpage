import 'package:flutter/material.dart';
import 'package:restaurentlanding/Pages/Views/DateDropdownButton.dart';
import 'package:restaurentlanding/Pages/Views/TimeDropdownButton.dart';
import 'package:restaurentlanding/Style/Style.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class BookingMobilePage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController numberOfPeopleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "TABLE RESERVATION",
            style: ThemText.bigTextTitle.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.8,
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
                height: 12,
              ),
              Container(
                height: 40,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Center(
                  child: TextField(
                    maxLines: 1,
                    controller: emailController,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Enter your email'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                width: size.width * 0.8,
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
                height: 12,
              ),
              Container(
                height: 40,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Center(
                  child: TextField(
                    maxLines: 1,
                    controller: numberOfPeopleController,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Number of people'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
            height: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.8,
                child: Text(
                  "Note for us:",
                  style: ThemText.bigTextTitle.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 100,
                width: size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 16),
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
            "Table is kept for 15 minutes after reservation time. \nWe appreciate you being on time.",
            textAlign: TextAlign.center,
          ),
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
    String emailBody = Uri.encodeComponent(
        "Email: ${emailController.text}. Number of people: ${numberOfPeopleController.text}. Note: ${noteController.text}");
    Uri mail =
        Uri.parse("mailto:$emailTo?subject=$emailSubject&body=$emailBody");
    if (!isWebMobile()) {
      mail = Uri.parse(buildEmailUrl(
          emailTo: emailTo,
          emailCC: emailCC,
          emailSubject: emailSubject,
          emailBody: emailBody));
    } else {
      // do nothing
    }
    if (await canLaunchUrl(mail)) {
      await launchUrl(mail);
      //email app opened
    } else {
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
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.linux);
    print("kIsWeb = $kIsWeb");
    print("defaultTargetPlatform = $defaultTargetPlatform");

    print("isWebMobile = $isWebMobile");
    return isWebMobile;
  }
}
