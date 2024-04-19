import 'package:painel_hortifrutti/app/data/models/product_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class CategoryRepository {
  final Api _api;

  CategoryRepository(this._api);

  Future<List<ProductModel>> getProducts(int categoryId) {
    return _api.getProducts(categoryId);
  }
}
