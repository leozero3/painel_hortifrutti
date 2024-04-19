import 'package:painel_hortifrutti/app/data/models/user_login_request_model.dart';
import 'package:painel_hortifrutti/app/data/services/auth/auth_service.dart';
import 'package:painel_hortifrutti/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'cliente@email.com');
  final passwordController = TextEditingController(text: '123456');
  final loading = false.obs;

  void login() {
    Get.focusScope!.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userLoginRequestModel = UserLoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    loading.value = true;
    _authService.login(userLoginRequestModel).then((value) {
      Get.offNamed(Routes.dashboard);
    }, onError: (error) {
      Get.dialog(AlertDialog(
        title: Text(error.toString()),
      ));
    }).whenComplete(() => loading(false));
  }
}
