import 'package:flutter/material.dart';
import 'package:solmusic/NavigationBar/NavigationBar.dart';
import 'package:solmusic/Pages/BookingPage.dart';
import 'package:solmusic/Pages/ContactPage.dart';
import 'package:solmusic/Pages/LandingPage.dart';
import 'package:solmusic/Pages/MenuPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeItem type = HomeItem.LandingOage;
  bool cookiesAccepted = false;

  @override
  Widget build(BuildContext context) {
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
            if (type == HomeItem.LandingOage) LandingPage(),
            if (type == HomeItem.Menupage) MenuPage(),
            if (type == HomeItem.BookPage) BookingPage(),
            if (type == HomeItem.ContactPage) ContactPage(),
          ],
        ),
      ),
      bottomSheet: cookiesAccepted
          ? null
          : Container(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      color: Colors.grey,
                      child: Text("Accept Cookies"),
                    ),
                  ),
                ],
              )),
            ),
    );
  }
}

enum HomeItem { LandingOage, Menupage, BookPage, ContactPage }
