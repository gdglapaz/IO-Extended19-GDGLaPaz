import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions{
  getUserPoints(String userEmail){
    return Firestore.instance
        .collection("tickets")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
  }
}