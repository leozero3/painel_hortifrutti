import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:painel_hortifrutti/app/routes/pages.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_controller.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryController controller;
  CategoryWidget({String? tag, super.key})
      : controller = Get.find<CategoryController>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView(
        children: [
          for (var product in state!)
            ListTile(
              title: Text(product.name),
              subtitle: Text(
                  NumberFormat.simpleCurrency().format(product.price) +
                      (product.isKg ? '/kg' : '')),
              // leading: product.image != null
              //     ? SizedBox(
              //         width: 56.0,
              //         height: 56.0,
              //         // child: ClipRRect(
              //         //   borderRadius: BorderRadius.circular(8.0),
              //         //   child: FadeInImage.memoryNetwork(
              //         //     placeholder: kTransparentImage,
              //         //     image: product.image!,
              //         //   ),
              //         // ),
              //       )
              //     : null,
              onTap: () => Get.toNamed(Routes.product, arguments: {
                'product': product,
                'store': state,
              }),
            )
        ],
      ),
      onEmpty: const Center(
        child: Text('Nenhum Produto cadastrado na categoria'),
      ),
      onError: (error) {
        return Text('erro aqui $error');
      },

      //     ListView(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const SizedBox(height: 8),
      //               Row(
      //                 children: [
      //                   Expanded(
      //                     child: Text(
      //                       '#${order.hashId}',
      //                       style: Get.textTheme.titleMedium,
      //                     ),
      //                   ),
      //                   Text(
      //                     'Data ${DateFormat("dd/MM/y 'as' HH:mm").format(order.createdAt)}',
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         const SizedBox(height: 8),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Text(
      //             'Endereço de Entrega'.toUpperCase(),
      //             style: Get.textTheme.titleMedium,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Text(
      //             '${order.address!.street}, n° ${order.address!.number}, ${order.address!.neighborhood}',
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Text(
      //             'Andamento do Pedido'.toUpperCase(),
      //             style: Get.textTheme.titleMedium,
      //           ),
      //         ),
      //         for (var status in order.statusList)
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16),
      //             child: ListTile(
      //               title: Text(status.name),
      //               trailing: Text(DateFormat.Hm().format(status.createAt)),
      //             ),
      //           ),
      //         OrderNextStatusWidget(
      //           order.statusList.last,
      //           controller.OnSendStatus,
      //         ),
      //         const SizedBox(height: 8),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Text(
      //             'Produtos'.toUpperCase(),
      //             style: Get.textTheme.titleMedium,
      //           ),
      //         ),
      //         for (var orderProduct in order.productList)
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 16),
      //             child: ListTile(
      //               title: Text(orderProduct.product.name),
      //               leading: _buildProductQuantity(orderProduct),
      //               trailing: Text(
      //                 '${NumberFormat.simpleCurrency().format(orderProduct.total)}',
      //               ),
      //             ),
      //           ),
      //         const SizedBox(height: 8),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           child: Row(
      //             children: [
      //               const Expanded(
      //                 child: Text('Custo de Entrega'),
      //               ),
      //               Text(
      //                 '${NumberFormat.simpleCurrency().format(order.deliveryCost)} ',
      //               ),
      //             ],
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: Text(
      //                   'Total',
      //                   style: Get.textTheme.titleMedium,
      //                 ),
      //               ),
      //               Text(
      //                 '${NumberFormat.simpleCurrency().format(order.value)} ',
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
    );
  }
}
