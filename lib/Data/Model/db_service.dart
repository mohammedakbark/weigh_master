import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weigh_master/Data/Model/buy_product_model.dart';
import 'package:weigh_master/Data/Model/cartmodel.dart';
import 'package:weigh_master/Data/Model/product_model.dart';
import 'package:weigh_master/Data/Model/user_model.dart';

class DBService with ChangeNotifier {
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

  Future addProductToCart(CartModel cartModel) async {
    await db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(cartModel.productModel.id)
        .set(cartModel.toJson(cartModel.productModel.id));
  }

  UserModel? currentModel;
  fetchCurrentUser() async {
    final snashot = await FirebaseFirestore.instance
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    log(snashot.data()!.toString());
    currentModel = UserModel.fromJson(snashot.data()!);
  }

  editProfile(String name) async {
    await FirebaseFirestore.instance
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"address": name});
    notifyListeners();
  }

  afterCompletPayment(BuyProductModel buyProductModel) {
    final doc = db.collection("My Orders").doc();
    doc.set(buyProductModel.toJson(doc.id));
  }
}
