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

  Future afterCompletPayment(BuyProductModel buyProductModel) async {
    final doc = db.collection("My Orders").doc();
    await doc.set(buyProductModel.toJson(doc.id));

    // notifyListeners();
  }

  removeFromCar() async {
    final collection = await db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .get();
    for (var i in collection.docs) {
      _delete(i);
    }
  }

  _delete(QueryDocumentSnapshot<Map<String, dynamic>> i) {
    db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(i.data()["id"])
        .delete();
  }

  addToMyFav(ProductModel productModel) async {
    db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Fav")
        .doc(productModel.id)
        .set(productModel.toHson(productModel.id));
  }

  removeFromMyFav(id, bool listen) async {
    db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Fav")
        .doc(id)
        .delete();
    if (listen == true) {
      notifyListeners();
    }
  }

  List<ProductModel> favList = [];
  getMyAllFav() async {
    final snapshot = await db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Fav")
        .get();
    // log("message");
    // log(snapshot.docs.length.toString());
    favList =
        snapshot.docs.map((e) => ProductModel.fromJson(e.data())).toList();
  }

  Future<bool> checkIsFavOrNot(id) async {
    final snapshot = await db
        .collection("User Collection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("My Fav")
        .doc(id)
        .get();
    if (snapshot.exists) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  List<BuyProductModel> listOfBuy = [];
  Future getMyBroughtProduct() async {
    final snapshot = await db
        .collection("My Orders")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    // log(snapshot.docs.length.toString());
    listOfBuy = snapshot.docs.map((e) {
      return BuyProductModel.fromjson(e.data());
    }).toList();
    // snapshot.where("productModel",isEqualTo: )
  }


  // getDataFroHome(){
  //   return db.collection(collectionPath)
  // }
}
