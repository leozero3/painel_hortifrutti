import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_repository.dart';
import 'package:get/get.dart';
import '../../widgets/category/category_controller.dart';

class CategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
        () => CategoryController(CategoryRepository(Get.find<Api>())));
  }
}
