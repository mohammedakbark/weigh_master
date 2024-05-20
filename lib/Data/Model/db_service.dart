import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weigh_master/Data/Model/user_model.dart';

class DBService {
  final db = FirebaseFirestore.instance;

  Future addUser(uid, UserModel userModel) async {
    db.collection("User Collection").doc(uid).set(userModel.toJson());
  }

  getProducts(String type) {
    return db
        .collection("Product Data")
        .where("type", isEqualTo: type)
        .snapshots();
  }
}
