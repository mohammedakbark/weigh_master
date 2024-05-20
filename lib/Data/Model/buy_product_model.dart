import 'package:weigh_master/Data/Model/product_model.dart';

class BuyProductModel {
  String? buyId;
  ProductModel productModel;
  double totalAmount;
  String uid;
  // int quantity;
  BuyProductModel({
    this.buyId,
    required this.uid,
    required this.productModel,
    required this.totalAmount,
  });
  Map<String, dynamic> toJson(id) => {
        "buyId": id,
        "uid": uid,
        "productModel": productModel.toHson(productModel.id),
        "totalAmount": totalAmount,
      };

  factory BuyProductModel.fromjson(Map<String, dynamic> json) {
    return BuyProductModel(
        uid: json["uid"],
        productModel: ProductModel.fromJson(json["productModel"]),
        totalAmount: json["totalAmount"],
        buyId: json["buyId"]);
  }
}
