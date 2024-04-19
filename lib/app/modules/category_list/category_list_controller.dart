import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/modules/category_list/category_list_repository.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_controller.dart';

class CategoryListController extends GetxController
    with StateMixin<List<CategoryModel>> {
  final CategoryListRepository _repository;
  final categorySelected = RxnInt();

  CategoryListController(this._repository);

  @override
  void onInit() {
    loadOrders();
    super.onInit();
  }

  Future<void> loadOrders() async {
    await _repository.getCategories().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data.cast<CategoryModel>(), status: status);
    }, onError: (error) {
      change(error, status: RxStatus.error(error.toString()));
    });
  }

  void changeCategory(CategoryModel category) {
    categorySelected.value = category.id;
    Get.find<CategoryController>(tag: 'detail').categoryId.value = category.id;
  }
}
