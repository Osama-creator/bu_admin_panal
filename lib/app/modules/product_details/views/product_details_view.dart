import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ProductDetailsController>(
          init: ProductDetailsController(),
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: const Color(0x1AD1EC43),
                width: context.width,
                height: context.height * 0.15,
                child: Image.network(
                  controller.args[0].image,
                  fit: BoxFit.fill,
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _.updateProduct,
                    child: const Text('تعديل'),
                  ),
                  _.isEditing
                      ? ElevatedButton(
                          onPressed: _.deleteProduct,
                          child: const Text('حذف'),
                        )
                      : Container()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const MyTextFeild({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
