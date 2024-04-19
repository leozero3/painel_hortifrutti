import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/modules/category_list/category_list_controller.dart';
import 'package:painel_hortifrutti/app/modules/category_list/category_list_repository.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_controller.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_repository.dart';
import 'package:painel_hortifrutti/app/modules/user_profile/user_profile_controller.dart';
import 'package:painel_hortifrutti/app/modules/user_profile/user_profile_repository.dart';
import 'package:get/get.dart';
import './dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());

    Get.lazyPut<UserProfileController>(
        () => UserProfileController(UserProfileRepository(Get.find<Api>())));

    Get.lazyPut<OrderListController>(
        () => OrderListController(OrderListRepository(Get.find<Api>())));

    Get.lazyPut<CategoryListController>(
        () => CategoryListController(CategoryListRepository(Get.find<Api>())));
  }
}
