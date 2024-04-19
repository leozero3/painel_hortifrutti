import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_controller.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_repository.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<OrderModel> {
  final OrderRepository _repository;

  OrderController(this._repository);

  final orderId = RxnString();

  @override
  void onInit() {
    String? id = Get.parameters['id'];

    ever(orderId, (String? id) => loadOrder());

    if (id != null) {
      orderId.value = id;
    }

    super.onInit();
  }

  Future<void> loadOrder() async {
    String id = orderId.value!;
    change(state, status: RxStatus.loading());

    await _repository.getOrder(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<void> OnSendStatus(int statusId) async {
    await _repository.postOrderStatus(orderId.value!, statusId).then(
        (data) async {
      await loadOrder();
      await Get.find<OrderListController>().loadOrders();
    }, onError: (error) {
      Get.dialog(AlertDialog(
        title: Text(error.toString()),
      ));
    });
  }
}
