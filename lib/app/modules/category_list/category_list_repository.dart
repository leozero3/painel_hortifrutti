import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class CategoryListRepository {
  final Api _api;

  CategoryListRepository(this._api);

  Future<List<CategoryModel>> getCategories() {
    return _api.getCategories();
  }
}
