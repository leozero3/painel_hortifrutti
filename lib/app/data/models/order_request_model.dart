import 'package:painel_hortifrutti/app/data/models/address_model.dart';
import 'package:painel_hortifrutti/app/data/models/cart_product_model.dart';
import 'package:painel_hortifrutti/app/data/models/payment_method_model.dart';
import 'package:painel_hortifrutti/app/data/models/store_model.dart';

class OrderRequestModel {
  StoreModel store;
  PaymentMethodModel paymentMethod;
  List<CartProductModel> cartProducts;
  AddressModel address;
  String? observation;

  OrderRequestModel({
    required this.store,
    required this.paymentMethod,
    required this.cartProducts,
    required this.address,
    this.observation,
  });

  Map<String, dynamic> toJson() {
    return {
      'estabelecimento_id': store.id,
      'meios_pagamento_id': paymentMethod.id,
      'produtos':
          cartProducts.map((cartProduct) => cartProduct.toJson()).toList(),
      'endereco_id': address.id,
      'observacao': observation,
    };
  }
}
