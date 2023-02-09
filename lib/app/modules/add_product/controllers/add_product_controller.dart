import 'dart:developer';
import 'dart:io';

import 'package:bu_admin_panal/helpers/pick.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddProductController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController sizesController = TextEditingController();
  TextEditingController colorsController = TextEditingController();
  final categoryId = Get.arguments as String;
  File? image;
  late String imageString;
  late bool imageUploaded;

  Future<void> pickFile() async {
    final tempImage = await Pick.imageFromGallery();
    if (tempImage != null) {
      image = tempImage;
      Reference reference =
          FirebaseStorage.instance.ref().child(const Uuid().v1());
      final UploadTask uploadTask = reference.putFile(image!);
      uploadTask.whenComplete(
        () async {
          imageString = await uploadTask.snapshot.ref.getDownloadURL();
          imageUploaded = true;
          log(imageUploaded.toString());
        },
      );
      update();
    }
  }

  void createProduct() async {
    if (imageUploaded) {
      try {
        await FirebaseFirestore.instance
            .collection("categories")
            .doc(categoryId)
            .collection('products')
            .add({
          'name': nameController.text,
          'image': imageString,
          'price': double.parse(priceController.text),
          'quantity': int.parse(quantityController.text),
          'sizes': sizesController.text.split(','),
          'colors': colorsController.text.split(','),
        });
        Get.back();
        update();
        Get.snackbar('Success', 'Product created successfully');
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    } else {
      log("err");
    }
  }
}
