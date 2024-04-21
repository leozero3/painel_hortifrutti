import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/models/category_request_model.dart';
import 'package:painel_hortifrutti/app/modules/product/product_controller.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/new_category/new_category_repository.dart';

class NewCategoryController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'joias');
  final loading = false.obs;

  final NewCategoryRepository _repository;

  NewCategoryController(this._repository);

  void onSubmit() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    var categoryRequest = CategoryRequestModel(
      name: nameController.text,
    );

    loading(true);

    _repository.postCategory(categoryRequest).then((category) async {
      final productController = Get.find<ProductController>();
      await productController.loadCategories();
      productController.changeCategory(category.id);

      // final categoryListController = Get.find<CategoryListController>();
      // await categoryListController.loadCategories();

      Get.back();
    }, onError: (error) {
      Get.dialog(AlertDialog(
        title: Text('erro aqui ${error.toString()}'),
      ));
    }).whenComplete(() => loading(false));
  }
}
