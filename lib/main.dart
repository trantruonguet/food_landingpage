import 'package:flutter/material.dart';
import 'package:restaurentlanding/Firebase/FirestoreDBRepo.dart';
import 'package:restaurentlanding/Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String restaurantName = "";

  @override
  void initState() {
    super.initState();
  }

  void getRestaurantName() async {
    FirestoreDBRepo repo = FirestoreDBRepo();
    final data = await repo.getData();
    restaurantName = data.restaurantName ?? "";
    setState(() {
      restaurantName = restaurantName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: restaurantName,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
