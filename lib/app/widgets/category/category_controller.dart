import 'package:painel_hortifrutti/app/data/models/product_model.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_repository.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
    with StateMixin<List<ProductModel>> {
  final CategoryRepository _repository;

  CategoryController(this._repository);

  final categoryId = RxnInt();

  @override
  void onInit() {
    // String? id = Get.parameters['id'];

    ever(categoryId, (_) => loadProducts());

    if (Get.currentRoute != '/' && Get.parameters.containsKey('category_id')) {
      categoryId.value = int.parse(Get.parameters['category_id']!);
    }

    super.onInit();
  }

  Future<void> loadProducts() async {
    change(state, status: RxStatus.loading());

    await _repository.getProducts(categoryId.value!).then((data) {
      if (data.isEmpty) {
        change(data, status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    }, onError: (error) {
      change(error, status: RxStatus.error('erro aqui'));
    });
  }
}
