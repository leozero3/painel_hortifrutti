import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/modules/store/store_controller.dart';
import 'package:painel_hortifrutti/app/modules/store/store_repository.dart';
import 'package:get/get.dart';

class StoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(StoreRepository(Get.find<Api>())),
    );
  }
}
