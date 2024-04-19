import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import './product_controller.dart';

class ProductPage extends GetView<ProductController> {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = controller.product.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            // if (product.image != null) ...[
            //   Align(
            //     child: Container(
            //       padding: const EdgeInsets.only(bottom: 4),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(8),
            //         child: FadeInImage.memoryNetwork(
            //           placeholder: kTransparentImage,
            //           image: product.image!,
            //         ),
            //       ),
            //     ),
            //   ),
            //   const SizedBox(height: 4),
            // ],
            if (product.description != null)
              Text(
                product.description!,
                style: Get.textTheme.titleMedium,
              ),
            Text(
              NumberFormat.simpleCurrency().format(product.price) +
                  (product.isKg ? '/Kg' : ''),
              style: Get.textTheme.titleLarge,
            ),
            TextField(
              controller: controller.observationController,
              decoration: const InputDecoration(labelText: 'Observação'),
              maxLength: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Altere ${product.isKg ? 'o peso' : 'a quantidade'}',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  QuantityAndWeightWidget(isKg: product.isKg),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.addToCart();
                },
                child: const Text('Adicionar no carrrinho'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
