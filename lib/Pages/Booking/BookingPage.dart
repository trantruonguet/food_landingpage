import 'package:flutter/material.dart';
import 'package:restaurentlanding/Pages/Booking/BookingDesktopPage.dart';
import 'package:restaurentlanding/Pages/Booking/BookingMobilePage.dart';

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
      if (constraints.maxWidth >= 600) {
        return BookingDesktopPage();
      } else {
        return BookingMobilePage();
      }
    });
  }
}
