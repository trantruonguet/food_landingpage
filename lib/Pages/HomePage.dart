import 'package:flutter/material.dart';
import 'package:solmusic/NavigationBar/NavigationBar.dart';
import 'package:solmusic/Pages/BookingPage.dart';
import 'package:solmusic/Pages/LandingPage.dart';
import 'package:solmusic/Pages/MenuPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeItem type = HomeItem.BookPage;

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
                    // type = HomeItem.LandingOage;
                    type = HomeItem.BookPage;
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
            if (type == HomeItem.ContactPage) Container(),
          ],
        ),
      ),
    );
  }
}

enum HomeItem { LandingOage, Menupage, BookPage, ContactPage }
