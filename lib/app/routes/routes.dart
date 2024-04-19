part of './pages.dart';

abstract class Routes {
  static const dashboard = '/';
  static const product = '/product';
  static const login = '/login';
  static const order = '/order/:id';
  static const category = '/categories/:category_id';
}
