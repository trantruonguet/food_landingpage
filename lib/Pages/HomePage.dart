import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:restaurentlanding/Firebase/FirestoreDBRepo.dart';
import 'package:restaurentlanding/Firebase/FirestoreData.dart';
import 'package:restaurentlanding/NavigationBar/NavigationBar.dart';
import 'package:restaurentlanding/Pages/Booking/BookingPage.dart';
import 'package:restaurentlanding/Pages/Contact/ContactPage.dart';
import 'package:restaurentlanding/Pages/Landing/LandingPage.dart';
import 'package:restaurentlanding/Pages/Menu/MenuPage.dart';

import 'Menu/MenuPageTemp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeItem type = HomeItem.LandingOage;
  FirestoreDBRepo dbRepo = FirestoreDBRepo();
  FirestoreData? data;
  bool cookiesAccepted = false;

  @override
  void initState() {
    super.initState();
    getData();
    // FirebaseAnalytics.instance.logEvent(name: "enter_app");
  }

  void getData() async {
    data = await dbRepo.getData();
    setState(() {
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavigationBarItem(
                onLandingPagePress: () {
                  setState(() {
                    if (type != HomeItem.LandingOage) {
                      type = HomeItem.LandingOage;
                      FirebaseAnalytics.instance.logEvent(name: "select_landing");
                    }
                  });
                },
                onMenuPagePress: () {
                  setState(() {
                    if (type != HomeItem.Menupage) {
                      type = HomeItem.Menupage;
                      FirebaseAnalytics.instance.logEvent(name: "select_menu");
                    }
                  });
                },
                onBookPagePress: () {
                  setState(() {
                    if (type != HomeItem.BookPage) {
                      type = HomeItem.BookPage;
                      FirebaseAnalytics.instance.logEvent(name: "select_book");
                    }
                  });
                },
                onContactPagePress: () {
                  setState(() {
                    if (type != HomeItem.ContactPage) {
                      type = HomeItem.ContactPage;
                      FirebaseAnalytics.instance.logEvent(name: "select_contact");
                    }
                  });
                },
                restaurantName: data?.restaurantName ?? "",
              ),
              if (type == HomeItem.LandingOage) LandingPage(data: data),
              if (type == HomeItem.Menupage)
                MenuPageTemp(),

              // MenuPage(
                //   data: data,
                // ),
              if (type == HomeItem.BookPage) BookingPage(),
              if (type == HomeItem.ContactPage)
                ContactPage(
                  data: data,
                ),
            ],
          ),
        ),
        bottomSheet: cookiesAccepted
            ? null
            : size.width >= 600
                ? cookies()
                : cookiesMobile());
  }

  cookies() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You agree with our services"),
          SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                cookiesAccepted = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              color: Colors.grey,
              child: Text("Accept Cookies"),
            ),
          ),
        ],
      )),
    );
  }

  cookiesMobile() {
    return Container(
      height: 60,
      width: double.infinity,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You agree with our services"),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                cookiesAccepted = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: Colors.grey,
              child: Text("Accept Cookies"),
            ),
          ),
        ],
      )),
    );
  }
}

enum HomeItem { LandingOage, Menupage, BookPage, ContactPage }
