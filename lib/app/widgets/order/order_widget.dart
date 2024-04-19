import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/data/models/order_product_model.dart';
import 'package:painel_hortifrutti/app/widgets/order/order_controller.dart';
import 'package:painel_hortifrutti/app/widgets/order_next_status/order_next_status_widget.dart';

class OrderWidget extends StatelessWidget {
  final OrderModel order;
  final OrderController controller;
  OrderWidget(this.order, {String? tag, super.key})
      : controller = Get.find<OrderController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '#${order.hashId}',
                      style: Get.textTheme.titleMedium,
                    ),
                  ),
                  Text(
                    'Data ${DateFormat("dd/MM/y 'as' HH:mm").format(order.createdAt)}',
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Endereço de Entrega'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${order.address!.street}, n° ${order.address!.number}, ${order.address!.neighborhood}',
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Andamento do Pedido'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        for (var status in order.statusList)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(status.name),
              trailing: Text(DateFormat.Hm().format(status.createAt)),
            ),
          ),
        OrderNextStatusWidget(
          order.statusList.last,
          controller.OnSendStatus,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Produtos'.toUpperCase(),
            style: Get.textTheme.titleMedium,
          ),
        ),
        for (var orderProduct in order.productList)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              title: Text(orderProduct.product.name),
              leading: _buildProductQuantity(orderProduct),
              trailing: Text(
                '${NumberFormat.simpleCurrency().format(orderProduct.total)}',
              ),
            ),
          ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Expanded(
                child: Text('Custo de Entrega'),
              ),
              Text(
                '${NumberFormat.simpleCurrency().format(order.deliveryCost)} ',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Total',
                  style: Get.textTheme.titleMedium,
                ),
              ),
              Text(
                '${NumberFormat.simpleCurrency().format(order.value)} ',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductQuantity(OrderProductModel orderProduct) {
    return Text(
      NumberFormat.decimalPattern().format(orderProduct.quantity) +
          (orderProduct.product.isKg ? 'Kg' : 'x'),
    );
  }
}
