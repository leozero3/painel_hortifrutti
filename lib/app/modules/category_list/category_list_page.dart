import 'package:painel_hortifrutti/app/modules/category_list/category_list_controller.dart';
import 'package:painel_hortifrutti/app/modules/category_list/widgets/category_list_widget.dart';
import 'package:painel_hortifrutti/app/modules/category_list/widgets/category_detail_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/routes/pages.dart';

class CategoryListPage extends GetResponsiveView<CategoryListController> {
  CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        actions: [
          TextButton(
              onPressed: () => Get.toNamed(Routes.product),
              child: Text('Novo Produto'))
        ],
        centerTitle: true,
      ),
      body: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: CategoryListWidget(
                controller.changeCategory,
              ),
            ),
          ),
          Flexible(flex: 3, child: CategoryDetailWidget())
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Produtos'),
          centerTitle: true,
        ),
        body: CategoryListWidget(
          (category) => Get.toNamed(Routes.category.replaceFirst(
            ':category_id',
            category.id.toString(),
          )),
        ));
  }
}
