import 'package:get/get.dart';

import '../modules/add_product/bindings/add_product_binding.dart';
import '../modules/add_product/views/add_product_view.dart';
import '../modules/control_products/bindings/control_products_binding.dart';
import '../modules/control_products/views/control_products_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_category_products/bindings/list_category_products_binding.dart';
import '../modules/list_category_products/views/list_category_products_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CONTROL_PRODUCTS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTROL_PRODUCTS,
      page: () => const ControlProductsView(),
      binding: ControlProductsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CATEGORY_PRODUCTS,
      page: () => const ListCategoryProductsView(),
      binding: ListCategoryProductsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
  ];
}
