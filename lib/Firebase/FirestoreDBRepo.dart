import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solmusic/constant.dart';
import 'FirestoreData.dart';

class FirestoreDBRepo {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<FirestoreData> getData() async {
    final docRef = db.collection("restaurants").doc(kFirestoreCollectionId);

    DocumentSnapshot querySnapshot = await docRef.get();
    final json = querySnapshot.data() as Map<String, dynamic>;
    print("json = $json");
    final firestoreData = FirestoreData.fromJson(json);
    print("object = ${firestoreData.toJson()}");
    return firestoreData;
  }
}