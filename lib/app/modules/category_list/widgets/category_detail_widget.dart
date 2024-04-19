import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/modules/category_list/category_list_controller.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_controller.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_repository.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_widget.dart';

class CategoryDetailWidget extends StatelessWidget {
  CategoryDetailWidget({super.key});
  final controller = Get.put(
    CategoryController(CategoryRepository(Get.find<Api>())),
    tag: 'detail',
    permanent: true,
  );
  final categoryListController = Get.find<CategoryListController>();

  @override
  Widget build(BuildContext context) {
    return ObxValue((categorySelected) {
      if (categorySelected.value == null) {
        return const Center(
          child: Text('Clique em uma Categoria ao lado para ver os Produtos'),
        );
      }
      return CategoryWidget(tag: 'detail');
    }, categoryListController.categorySelected);
  }
}
