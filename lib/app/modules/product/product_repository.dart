import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class ProductRepository {
  final Api _api;

  ProductRepository(this._api);

  Future<List<CategoryModel>> getCategories() {
    return _api.getCategories();
  }
}
