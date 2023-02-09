import 'package:get/get.dart';

import '../controllers/list_category_products_controller.dart';

class ListCategoryProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListCategoryProductsController>(
      ListCategoryProductsController(),
    );
  }
}
