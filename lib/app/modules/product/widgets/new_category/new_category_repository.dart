import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/data/models/category_request_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class NewCategoryRepository {
  final Api _api;

  NewCategoryRepository(this._api);

  Future<CategoryModel> postCategory(CategoryRequestModel categoryRequest) =>
      _api.postCategory(categoryRequest);
}
