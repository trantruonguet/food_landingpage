import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/NavigationBar/NavigationBar.dart';
import 'package:solmusic/Pages/LandingPage.dart';
import 'package:solmusic/Pages/MenuPage.dart';

import '../Firebase/FirestoreDBRepo.dart';
import 'ContactPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeItem type = HomeItem.Menupage;
  FirestoreDBRepo dbRepo = FirestoreDBRepo();
  FirestoreData? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    data = await dbRepo.getData();
    print('HomePage data = $data');
    setState(() {
      data: data;
    });
  }

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
            if (type == HomeItem.Menupage) MenuPage(data: data,),
            if (type == HomeItem.BookPage) Container(),
            if (type == HomeItem.ContactPage) ContactPage(data: data?.aboutUs ?? [],),
          ],
        ),
      ),
    );
  }
}

enum HomeItem { LandingOage, Menupage, BookPage, ContactPage }
