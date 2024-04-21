import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';

class ProductRequestModel {
  int? id;
  String name;
  num price;
  String unitOfMeasure;
  String? description;
  PlatformFile? image;
  int categoryId;

  ProductRequestModel({
    this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    this.description,
    this.image,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
      'descricao': description,
      'preco': price,
      'unidade': unitOfMeasure,
      'categoria_id': categoryId,
      'posicao': 1,
    };
  }

  factory ProductRequestModel.fromJson(Map<String, dynamic> json) {
    return ProductRequestModel(
      id: json['id'],
      name: json['nome'],
      price: json['preco'],
      unitOfMeasure: json['unidade'],
      description: json['descricao'],
      image: json['imagem'],
      categoryId: json['categoria_id'],
    );
  }
}
