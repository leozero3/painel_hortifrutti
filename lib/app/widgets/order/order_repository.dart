import 'package:painel_hortifrutti/app/data/models/order_model.dart';
import 'package:painel_hortifrutti/app/data/providers/api.dart';

class OrderRepository {
  final Api _api;

  OrderRepository(this._api);

  Future<OrderModel> getOrder(String id) {
    return _api.getOrder(id);
  }

  Future<void> postOrderStatus(String id, int statusId) {
    return _api.postOrderStatus(id, statusId);
  }
}
