import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './product_controller.dart';

class ProductPage extends GetResponsiveView<ProductController> {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    // var product = controller.product.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Produto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            if (screen.isPhone) ...[
              _buildForm(),
              const SizedBox(
                height: 16,
              ),
              _buildPickAndShowImage(),
              _buildSubmit(),
            ] else ...[
              Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildForm(),
                              _buildSubmit(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 4,
                          child: _buildPickAndShowImage(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: controller.nameController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (String? value) {
              if (value != null || value!.isEmpty) {
                return 'Informe o Nome do produto';
              }
              return null;
            },
          ),
          TextFormField(
            controller: controller.descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição'),
            minLines: 1,
            maxLines: 3,
            validator: (String? value) {
              if (value != null || value!.isEmpty) {
                return 'Informe a descrição do produto';
              }
              return null;
            },
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.priceController,
                  decoration: const InputDecoration(labelText: 'Preço'),
                  validator: (String? value) {
                    if (value != null || value!.isEmpty) {
                      return 'Informe o preço do produto';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 150,
                child: DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Unidade'),
                  items: ['UN', 'KG']
                      .map(
                        (unit) => DropdownMenuItem(
                          value: unit,
                          child: Text(unit),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          Obx(() {
            return DropdownButtonFormField(
              value: controller.categoryId.value,
              items: controller.categoryList
                  .map((category) => DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ))
                  .toList(),
              onChanged: controller.changeCategory,
              decoration: const InputDecoration(labelText: 'Categoria'),
              validator: (int? value) {
                if (value == null) {
                  return 'Selecione a categoria do produto';
                }
                return null;
              },
            );
          }),
          const SizedBox(height: 16),
          TextButton(
            onPressed: controller.goToCategory,
            child: const Text('Criar uma nova Categoria'),
          ),
        ],
      ),
    );
  }

  Row _buildSubmit() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                controller.onAdd();
              },
              child: const Text('Adicionar'),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPickAndShowImage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Imagem do Produto',
            style: Get.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          if (controller.image.value != null) {
            return _buildProductImage(
                Image.memory(controller.image.value!.bytes!));
          }
          return const SizedBox();
        }),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: OutlinedButton(
            onPressed: controller.pickImage,
            child: const Text('Selecionar uma Imagem'),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage(Image image) {
    return Align(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: image,
        ),
      ),
    );
  }
}
