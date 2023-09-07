import 'package:flutter/material.dart';
import 'package:solmusic/Firebase/FirestoreDBRepo.dart';
import 'package:solmusic/Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solmusic/Pages/LandingPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Restaurant',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}