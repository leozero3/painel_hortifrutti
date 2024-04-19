class ProductModel {
  final int id;
  final String name;
  final num price;
  final String unitOfMeasure;
  final String? description;
  final String? image;

  bool get isKg => unitOfMeasure == 'KG';

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['nome'] ?? '',
        price: double.parse(json['preco']?.toString() ?? '0.0'),
        unitOfMeasure: json['unidade'] ?? '',
        image: json['imagem'],
        description: json['descricao'] ?? '',
      );
}
