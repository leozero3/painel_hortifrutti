import 'package:painel_hortifrutti/app/data/models/store_model.dart';
import 'package:painel_hortifrutti/app/data/services/cart/cart_service.dart';
import 'package:painel_hortifrutti/app/modules/store/store_repository.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin<StoreModel> {
  final StoreRepository _repository;
  StoreController(this._repository);

  bool get showCartButton => Get.find<CartService>().isEmpty == false;

  @override
  void onInit() {
    int id = int.parse(Get.parameters['id']!);

    _repository.getStore(id).then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}
