import 'package:file_picker/file_picker.dart';
import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/data/models/product_model.dart';
import 'package:painel_hortifrutti/app/data/models/store_model.dart';
import 'package:painel_hortifrutti/app/data/services/cart/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/modules/product/product_repository.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/new_category/new_category_widget.dart';

class ProductController extends GetxController {
  final ProductRepository _repository;
  ProductController(this._repository);

  final product = Rxn<ProductModel>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final observationController = TextEditingController();

  final _cartService = Get.find<CartService>();

  final image = Rxn<PlatformFile>();
  final categoryList = RxList<CategoryModel>.empty()();
  final categoryId = RxnInt();

  final store = Rxn<StoreModel>();

  @override
  void onInit() {
    // product.value = Get.arguments['product'];
    loadCategories();
    super.onInit();
  }

  Future<void> loadCategories() async {
    await _repository.getCategories().then((data) {
      categoryList.assignAll(data);
    });
  }

  void changeCategory(int? categorySelected) {
    categoryId.value = categorySelected;
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, withData: true);

    if (result != null && result.files.isNotEmpty) {
      image.value = result.files.first;
    }
  }

  void onAdd() {}

  void goToCategory() {
    Get.dialog(NewCategoryWidget());
  }
}
