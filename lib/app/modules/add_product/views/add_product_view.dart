import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../product_details/views/product_details_view.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (_) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    color: const Color(0x1AD1EC43),
                    width: context.width,
                    height: context.height * 0.15,
                    child: InkWell(
                      onTap: controller.pickFile,
                      child: controller.image == null
                          ? const Icon(
                              Icons.add,
                            )
                          : Image.file(
                              controller.image!,
                            ),
                    ),
                  ),
                  if (controller.image != null)
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                        ),
                        onPressed: () {
                          controller.image = null;
                        },
                      ),
                    ),
                ],
              ),
              MyTextFeild(
                controller: _.nameController,
                hintText: 'أدخل الإسم',
                labelText: "أسم المنتج",
              ),
              MyTextFeild(
                controller: _.priceController,
                hintText: 'أدخل السعر',
                labelText: "سعر المنتج",
              ),
              MyTextFeild(
                controller: _.quantityController,
                hintText: 'أدخل العدد',
                labelText: "عدد المنتج",
              ),
              MyTextFeild(
                controller: _.sizesController,
                hintText: 'أدخل المقاسات',
                labelText: "مقاسات المنتج",
              ),
              MyTextFeild(
                controller: _.colorsController,
                hintText: 'أدخل الالوان',
                labelText: "الوان المنتج",
              ),
              ElevatedButton(
                onPressed: _.createProduct,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('إنشاء'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
