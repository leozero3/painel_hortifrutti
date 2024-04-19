class UserAddressRequestModel {
  int? id;
  String street;
  String number;
  String neighborhood;
  String referencePoint;
  String? complement;
  int cityId;
  UserAddressRequestModel({
    this.id,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.referencePoint,
    this.complement,
    required this.cityId,
  });

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'rua': street,
      'numero': number,
      'bairro': neighborhood,
      'ponto_referencia': referencePoint,
      if (complement!.isNotEmpty) 'complemento': complement,
      'cidade_id': cityId,
    };
  }
}
