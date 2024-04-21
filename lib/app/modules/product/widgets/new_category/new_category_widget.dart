import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';
import 'package:painel_hortifrutti/app/modules/product/widgets/new_category/new_category_repository.dart';
import './new_category_controller.dart';

class NewCategoryWidget extends StatelessWidget {
  NewCategoryWidget({super.key});

  final controller = Get.put(
    NewCategoryController(NewCategoryRepository(Get.find<Api>())),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Nova Categoria"),
      scrollable: true,
      content: Form(
        key: controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Fechar"),
          onPressed: () {
            Get.back();
          },
        ),
        Obx(
          () => TextButton(
            onPressed: controller.loading.isTrue ? null : controller.onSubmit,
            child: const Text("Adicionar"),
          ),
        ),
      ],
    );
  }
}
