import 'package:painel_hortifrutti/app/modules/order_list/widgets/order_detail_widget.dart';
import 'package:painel_hortifrutti/app/modules/order_list/widgets/order_list_widget.dart';
import 'package:painel_hortifrutti/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './order_list_controller.dart';

class OrderListPage extends GetResponsiveView<OrderListController> {
  OrderListPage({Key? key}) : super(key: key);

  @override
  Widget desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: OrderListWidget(
                controller.changeOrder,
              ),
            ),
          ),
          Flexible(flex: 3, child: OrderDetailWidget())
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          centerTitle: true,
        ),
        body: OrderListWidget(
          (order) =>
              Get.toNamed(Routes.order.replaceFirst(':id', order.hashId)),
        ));
  }
}
