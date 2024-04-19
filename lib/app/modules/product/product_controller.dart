import 'package:painel_hortifrutti/app/data/models/cart_product_model.dart';
import 'package:painel_hortifrutti/app/data/models/product_model.dart';
import 'package:painel_hortifrutti/app/data/models/store_model.dart';
import 'package:painel_hortifrutti/app/data/services/cart/cart_service.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    // store.value = Get.arguments['store'];

    super.onInit();
  }

  Future<void> addToCart() async {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    if (_cartService.isANewStore(store.value!)) {
      var startNewCart = await showDialogNewCard();

      if (startNewCart == true) {
        _cartService.clearCart();
      } else {
        return;
      }
    }

    if (_cartService.products.isEmpty) {
      _cartService.newCart(store.value!);
    }
    _cartService.addProductToCart(
      CartProductModel(
        product: product.value!,
        quantity: quantity,
        observation: observationController.text,
      ),
    );
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content: Text(
          'O item ${product.value!.name} foi adicionado no carrinho',
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () => Get.back());
  }

  Future<dynamic> showDialogNewCard() async {
    return await Get.dialog(AlertDialog(
      content: const Text(
        'Seu carrinho atual será perdido se adicionar produtos de outro estabelecimento.',
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Voltar'),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: const Text('Confirmar'),
        ),
      ],
    ));
  }
}
