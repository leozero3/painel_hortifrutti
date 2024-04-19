import 'package:painel_hortifrutti/app/data/models/product_model.dart';

class OrderProductModel {
  ProductModel product;
  num quantity;
  num value;
  String? observation;

  OrderProductModel({
    required this.product,
    required this.quantity,
    required this.value,
    this.observation,
  });
  num get total => value * quantity;
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      product: ProductModel.fromJson(json['produto']),
      quantity: num.parse(json['quantidade']),
      value: num.parse(json['valor']),
      observation: json['observacao'],
    );
  }
}
