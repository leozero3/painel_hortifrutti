import 'package:painel_hortifrutti/app/modules/user_profile/user_profile_controller.dart';
import 'package:painel_hortifrutti/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends GetView<UserProfileController> {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!controller.isLogged) {
          return Center(
            child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.login),
                child: const Text('Entrar com minha conta')),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu nome';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu Email';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu Telefone';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 8) {
                          return 'Informe uma senha valida maior que 8 caracteres';
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.submit,
                              child: const Text('Atualizar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: controller.logout,
                            child: const Text(
                              'Sair da minha conta',
                            ),
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
