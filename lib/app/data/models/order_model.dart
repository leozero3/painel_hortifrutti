import 'package:painel_hortifrutti/app/data/models/address_model.dart';
import 'package:painel_hortifrutti/app/data/models/order_product_model.dart';
import 'package:painel_hortifrutti/app/data/models/order_status_model.dart';
import 'package:painel_hortifrutti/app/data/models/payment_method_model.dart';
import 'package:painel_hortifrutti/app/data/models/store_model.dart';

class OrderModel {
  String hashId;
  // StoreModel store;
  num value;
  num deliveryCost;
  AddressModel? address;
  PaymentMethodModel? paymentMethod;
  List<OrderProductModel> productList;
  List<OrderStatusModel> statusList;
  String? observation;
  DateTime createdAt;

  OrderModel({
    required this.hashId,
    // required this.store,
    required this.value,
    required this.deliveryCost,
    required this.address,
    this.paymentMethod,
    required this.productList,
    required this.statusList,
    this.observation,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      hashId: json['hash_id'],
      // store: StoreModel.fromJson(json['estabelecimento']),
      value: double.parse(json['valor']?.toString() ?? '0.0'),
      deliveryCost: double.parse(json['custo_entrega']?.toString() ?? '0.0'),
      address: json['endereco'] == null
          ? null
          : AddressModel.fromJson(json['endereco']),
      paymentMethod: json['meio_pagamento'] == null
          ? null
          : PaymentMethodModel.fromJson(json['meio_pagamento']),
      productList: json['produtos'] == null
          ? []
          : List<OrderProductModel>.from(json['produtos']
              .map((status) => OrderProductModel.fromJson(status))),
      statusList: json['pedido_status'] == null
          ? []
          : List<OrderStatusModel>.from(json['pedido_status']
              .map((status) => OrderStatusModel.fromJson(status))),
      observation: json['observacao'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
