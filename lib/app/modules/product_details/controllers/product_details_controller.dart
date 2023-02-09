import 'package:bu_admin_panal/app/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController sizesController = TextEditingController();
  TextEditingController colorsController = TextEditingController();
  final args = Get.arguments as List;

  bool isEditing = false;
  // File? image;
  // late String imageString;
  // late bool imageUploaded;

  // Future<void> pickFile() async {
  //   final tempImage = await Pick.imageFromGallery();
  //   if (tempImage != null) {
  //     image = tempImage as File?;
  //     Reference reference =
  //         FirebaseStorage.instance.ref().child(const Uuid().v1());
  //     final UploadTask uploadTask = reference.putFile(image!!);
  //     uploadTask.whenComplete(
  //       () async {
  //         imageString = await uploadTask.snapshot.ref.getDownloadURL();
  //         imageUploaded = true;
  //         log(imageUploaded.toString());
  //       },
  //     );
  //     update();
  //   }
  // }
  // .collection("categories")
  //         .doc(categoryId)
  //         .collection('products')
  @override
  void onInit() {
    super.onInit();
    final product = args[0] as Product;
    isEditing = true;
    nameController.text = product.name;
    priceController.text = product.price.toString();
    quantityController.text = product.quantity.toString();
    sizesController.text = product.sizes.join(',');
    colorsController.text = product.colors.join(',');
  }

  void updateProduct() async {
    final catId = args[1] as String;
    final product = args[0] as Product;
    try {
      await FirebaseFirestore.instance
          .collection("categories")
          .doc(catId)
          .collection('products')
          .doc(product.id)
          .update({
        'name': nameController.text,
        'image': product.image,
        'price': double.parse(priceController.text),
        'quantity': int.parse(quantityController.text),
        'sizes': sizesController.text.split(','),
        'colors': colorsController.text.split(','),
      });
      Get.back();
      Get.snackbar('Success', 'Product updated successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void deleteProduct() async {
    final catId = args[1] as String;
    final product = args[0] as Product;
    try {
      await FirebaseFirestore.instance
          .collection("categories")
          .doc(catId)
          .collection('products')
          .doc(product.id)
          .delete();
      Get.back();
      Get.snackbar('Success', 'Product deleted successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
