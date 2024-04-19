import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_repository.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_controller.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_controller.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_widget.dart';

class OrderDetailWidget extends StatelessWidget {
  final orderListController = Get.find<OrderListController>();
  final controller = Get.put(
    OrderController(
      OrderRepository(Get.find<Api>()),
    ),
    tag: 'detail',
    permanent: true,
  );

  OrderDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObxValue((orderSelected) {
      if (orderSelected.value == null) {
        return Center(
          child: Text('Clique em um pedido ao lado para ver os Detalhes'),
        );
      }
      return controller.obx(
        (state) => OrderWidget(
          state!,
          tag: 'detail',
        ),
      );
    }, orderListController.orderSelected);
  }
}
