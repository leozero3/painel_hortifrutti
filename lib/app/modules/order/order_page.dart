import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_widget.dart';
import '../../widgets/order/order_controller.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
        centerTitle: true,
      ),
      body: controller.obx((state) => OrderWidget(state!)),
    );
  }
}
