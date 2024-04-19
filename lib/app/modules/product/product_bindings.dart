import 'package:get/get.dart';
import './product_controller.dart';

class ProductBindings implements Bindings {
    @override
    void dependencies() {
        Get.lazyPut<ProductController>(() => ProductController());
    }
}