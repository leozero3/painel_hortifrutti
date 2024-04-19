import 'package:painel_hortifrutti/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel Hortifruti - Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Informe seu Email';
                        }
                        if (value != null && !value.contains('@')) {
                          return 'Informe um Email valido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Informe a sua Senha';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Obx(() {
                              if (controller.loading.isTrue) {
                                return ElevatedButton(
                                  onPressed: () {
                                    // controller.login();
                                    null;
                                  },
                                  child: const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: const Text('Entrar'),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
