import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_repository.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_controller.dart';

class OrderListController extends GetxController
    with StateMixin<List<OrderModel>> {
  final OrderListRepository _repository;
  final orderSelected = RxnString();

  OrderListController(this._repository);

  @override
  void onInit() {
    loadOrders();
    super.onInit();
  }

  Future<void> loadOrders() async {
    await _repository.getOrders().then((data) {
      var status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    }, onError: (error) {
      change(error, status: RxStatus.error(error.toString()));
    });
  }

  void changeOrder(OrderModel order) {
    orderSelected.value = order.hashId;
    Get.find<OrderController>(tag: 'detail').orderId.value = order.hashId;
  }
}
