import 'package:weigh_master/Data/Model/product_model.dart';

class BuyProductModel {
  String? buyId;
  ProductModel productModel;
  double totalAmount;
  // int quantity;
  BuyProductModel(
      {this.buyId, required this.productModel, required this.totalAmount,});
  Map<String, dynamic> toJson(id) =>
      {"buyId": id, "productModel": productModel, "totalAmount": totalAmount,};
}
