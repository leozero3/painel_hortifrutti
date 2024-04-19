import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_controller.dart';

typedef ItemSelectedCallback = void Function(OrderModel order);

class OrderListWidget extends StatelessWidget {
  OrderListWidget(this.onItemSelected, {super.key});
  final OrderListController controller = Get.find<OrderListController>();
  final ItemSelectedCallback onItemSelected;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView(
        children: [
          for (var order in state!)
            Obx(() {
              return ListTile(
                title: Text(order.hashId),
                subtitle:
                    Text(DateFormat('dd/MM/Y HH:mm').format(order.createdAt)),
                trailing: Chip(
                  label: Text(order.statusList.last.name),
                ),
                onTap: () => onItemSelected(order),
                selected: controller.orderSelected.value == order.hashId,
              );
            })
        ],
      ),
      onEmpty: const Center(
        child: Text(
          'Voce nao recebeu nenhum pedido',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
