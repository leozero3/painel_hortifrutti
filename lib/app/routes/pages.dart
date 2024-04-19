import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:painel_hortifrutti/app/data/services/storage/storage_service.dart';
import 'package:painel_hortifrutti/app/modules/category/category_bindings.dart';
import 'package:painel_hortifrutti/app/modules/category/category_page.dart';
import 'package:painel_hortifrutti/app/modules/dashboard/dashboard_bindings.dart';
import 'package:painel_hortifrutti/app/modules/dashboard/dashboard_page.dart';
import 'package:painel_hortifrutti/app/modules/login/login_bindings.dart';
import 'package:painel_hortifrutti/app/modules/login/login_page.dart';
import 'package:painel_hortifrutti/app/modules/order/order_bindings.dart';
import 'package:painel_hortifrutti/app/modules/order/order_page.dart';
import 'package:painel_hortifrutti/app/modules/product/product_bindings.dart';
import 'package:painel_hortifrutti/app/modules/product/product_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBindings(),
      middlewares: [
        RedirectMiddleare(),
      ],
    ),
    GetPage(
      name: Routes.category,
      page: () => CategoryPage(),
      binding: CategoryBindings(),
    ),
    GetPage(
      name: Routes.product,
      page: () => ProductPage(),
      binding: ProductBindings(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
      binding: OrderBindings(),
    ),
  ];
}

class RedirectMiddleare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.find<StorageService>().token == null) {
      return const RouteSettings(name: Routes.login);
    }
    return null;
  }
}
