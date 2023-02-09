import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/models/categories_model.dart';
import '../../../routes/app_pages.dart';

class ControlProductsController extends GetxController {
  var isLoading = false;
  var categoriesList = <Category>[];

  Future<void> getData() async {
    try {
      // isLoading = true;

      QuerySnapshot categories =
          await FirebaseFirestore.instance.collection('categories').get();
      categoriesList.clear();
      for (var category in categories.docs) {
        categoriesList
            .add(Category(category['name'], category['image'], category.id));
      }
      isLoading = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    update();
  }

  void onTap(int index) {
    Get.toNamed(
      Routes.LIST_CATEGORY_PRODUCTS,
      arguments: categoriesList[index].id,
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
