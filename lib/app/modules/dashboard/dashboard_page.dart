import 'package:painel_hortifrutti/app/modules/category_list/category_list_page.dart';
import 'package:painel_hortifrutti/app/modules/order_list/order_list_page.dart';
import 'package:painel_hortifrutti/app/modules/user_profile/user_profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './dashboard_controller.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  @override
  Widget desktop() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Painel Hortifrutti"),
      ),
      body: Obx(() {
        return Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: controller.currentPageIndex.value,
              onDestinationSelected: controller.changePageIndex,
              labelType: NavigationRailLabelType.all,
              leading: const FlutterLogo(
                size: 48,
                style: FlutterLogoStyle.stacked,
              ),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  label: Text('Inicio'),
                  selectedIcon: Icon(Icons.explore_outlined),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.view_list_outlined),
                  label: Text('Produtos'),
                  selectedIcon: Icon(Icons.person),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  label: Text('Configurar'),
                  selectedIcon: Icon(Icons.view_list),
                ),
              ],
            ),
            Expanded(
              child: _body(),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          onDestinationSelected: controller.changePageIndex,
          selectedIndex: controller.currentPageIndex.value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              label: 'Inicio',
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list_outlined),
              label: 'Meus Pedidos',
              selectedIcon: Icon(Icons.view_list),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Configurar',
              selectedIcon: Icon(Icons.person),
            ),
          ],
        );
      }),
      body: _body(),
    );
  }

  Obx _body() {
    return Obx(() {
      return IndexedStack(
        index: controller.currentPageIndex.value,
        children: [
          OrderListPage(),
          CategoryListPage(),
          const UserProfilePage(),
        ],
      );
    });
  }
}
