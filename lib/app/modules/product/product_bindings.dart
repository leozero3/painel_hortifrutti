import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/modules/product/product_repository.dart';
import './product_controller.dart';

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
        () => ProductController(ProductRepository(Get.find<Api>())));
  }
}
