import 'package:flutter/cupertino.dart';
import 'package:solmusic/Firebase/FirestoreData.dart';
import 'package:solmusic/Pages/Contact/ContactDesktopPage.dart';
import 'package:solmusic/Pages/Contact/ContactMobilePage.dart';

class ContactPage extends StatelessWidget {
  final FirestoreData? data;

  const ContactPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 600) {
        return ContactDesktopPage(
          data: data,
        );
      } else {
        return ContactMobilePage(
          data: data,
        );
      }
    });
  }
}
