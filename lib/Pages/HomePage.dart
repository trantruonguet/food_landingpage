import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreDBRepo.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/NavigationBar/NavigationBar.dart';
import 'package:solmusic/Pages/Booking/BookingPage.dart';
import 'package:solmusic/Pages/Contact/ContactPage.dart';
import 'package:solmusic/Pages/Landing/LandingPage.dart';
import 'package:solmusic/Pages/Menu/MenuPage.dart';

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
                      // type = HomeItem.BookPage;
                    }
                  });
                },
                onMenuPagePress: () {
                  setState(() {
                    if (type != HomeItem.Menupage) {
                      type = HomeItem.Menupage;
                    }
                  });
                },
                onBookPagePress: () {
                  setState(() {
                    if (type != HomeItem.BookPage) {
                      type = HomeItem.BookPage;
                    }
                  });
                },
                onContactPagePress: () {
                  setState(() {
                    if (type != HomeItem.ContactPage) {
                      type = HomeItem.ContactPage;
                    }
                  });
                },
              ),
              if (type == HomeItem.LandingOage) LandingPage(data: data),
              if (type == HomeItem.Menupage)
                MenuPage(
                  data: data,
                ),
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
