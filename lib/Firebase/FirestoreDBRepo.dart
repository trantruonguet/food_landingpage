import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solmusic/generated/assets.dart';
import 'FirestoreData.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class FirestoreDBRepo {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<FirestoreData> getData() async {
    final String response =
        await rootBundle.loadString(Assets.assetsLandingPage);
    final data = await json.decode(response);
    final firestoreData = FirestoreData.fromJson(data);

    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyPrint = encoder.convert(firestoreData.toJson());
    print("object = $prettyPrint");

    return firestoreData;
  }
}
