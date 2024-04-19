import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/models/category_model.dart';
import 'package:painel_hortifrutti/app/modules/category_list/category_list_controller.dart';

typedef ItemSelectedCallback = void Function(CategoryModel category);

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget(this.onItemSelected, {super.key});
  final CategoryListController controller = Get.find<CategoryListController>();
  final ItemSelectedCallback onItemSelected;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView(
        children: [
          for (var category in state!)
            Obx(() {
              return ListTile(
                title: Text(category.name),
                onTap: () => onItemSelected(category),
                selected: controller.categorySelected.value == category.id,
              );
            })
        ],
      ),
    );
  }
}
