import 'package:painel_hortifrutti/app/data/models/city_model.dart';

class AddressModel {
  int id;
  String street;
  String number;
  String neighborhood;
  String referencePoint;
  String? complement;
  CityModel? city;

  AddressModel({
    required this.id,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.referencePoint,
    this.complement,
    this.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      street: map['rua'] ?? '',
      number: map['numero'] ?? '',
      neighborhood: map['bairro'] ?? '',
      referencePoint: map['ponto_referencia'] ?? '',
      complement: map['complemento'],
      city: map['cidade'] != null ? CityModel.fromJson(map['cidade']) : null,
    );
  }
}
