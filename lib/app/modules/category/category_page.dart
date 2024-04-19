import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/widgets/category/category_widget.dart';
import '../../widgets/category/category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produtos da Categoria'),
          centerTitle: true,
        ),
        body: CategoryWidget());
  }
}
