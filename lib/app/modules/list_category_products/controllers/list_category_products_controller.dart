import 'package:bu_admin_panal/app/data/models/categories_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../../routes/app_pages.dart';

class ListCategoryProductsController extends GetxController {
  var isLoading = false;
  var productsList = <Product>[];
  Category? cat;
  final categoryId = Get.arguments as String;
  Future<void> getData() async {
    // isLoading = true;
    try {
      QuerySnapshot products = await FirebaseFirestore.instance
          .collection("categories")
          .doc(categoryId)
          .collection('products')
          .get();
      productsList.clear();
      for (var product in products.docs) {
        productsList.add(Product(
          name: product['name'],
          image: product['image'],
          price: product['price'],
          id: product.id,
          quantity: product['quantity'],
          sizes: List<String>.from(product['sizes']),
          colors: List<String>.from(product['colors']),
        ));
      }
      isLoading = false;
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void onTap(int index) {
    Get.toNamed(
      Routes.PRODUCT_DETAILS,
      arguments: [productsList[index], categoryId],
    );
  }

  void onCreateTap() {
    Get.toNamed(
      Routes.ADD_PRODUCT,
      arguments: categoryId,
    );
  }

  @override
  void onInit() {
    getData();
    // print(productsList);
    super.onInit();
  }
}
