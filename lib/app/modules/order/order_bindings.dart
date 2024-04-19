import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_repository.dart';
import 'package:get/get.dart';
import '../../widgets/order/order_controller.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
        () => OrderController(OrderRepository(Get.find<Api>())));
  }
}
