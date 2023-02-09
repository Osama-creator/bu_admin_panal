import 'package:get/get.dart';

import '../controllers/control_products_controller.dart';

class ControlProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ControlProductsController>(
      ControlProductsController(),
    );
  }
}
