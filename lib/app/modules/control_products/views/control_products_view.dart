import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:queen/queen.dart';

import '../controllers/control_products_controller.dart';

class ControlProductsView extends GetView<ControlProductsController> {
  const ControlProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlProductsController>(
        init: ControlProductsController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'الاقسام',
              ),
            ),
            body: Center(
              child: controller.isLoading
                  ? const CircularProgressIndicator()
                  : GridView.builder(
                      itemCount: controller.categoriesList.length,
                      padding: const EdgeInsets.all(5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.90),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.onTap(index),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: context.height * 0.1,
                                  width: context.width * 0.5,
                                  child: Image.network(
                                    controller.categoriesList[index].image,
                                  ),
                                ),
                                Text(
                                  controller.categoriesList[index].name,
                                  style: context.headline6,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        });
  }
}
