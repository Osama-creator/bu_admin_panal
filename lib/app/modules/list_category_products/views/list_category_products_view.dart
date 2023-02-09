import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:queen/queen.dart';

import '../controllers/list_category_products_controller.dart';

class ListCategoryProductsView extends GetView<ListCategoryProductsController> {
  const ListCategoryProductsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListCategoryProductsController>(
        init: ListCategoryProductsController(),
        initState: (_) {},
        builder: (controller) {
          controller.getData();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'المنتجات',
              ),
            ),
            body: Center(
              child: controller.isLoading
                  ? const CircularProgressIndicator()
                  : GridView.builder(
                      itemCount: controller.productsList.length,
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
                                    controller.productsList[index].image,
                                  ),
                                ),
                                Text(
                                  controller.productsList[index].name,
                                  style: context.headline6,
                                ),
                                Text(
                                  controller.productsList[index].price
                                      .toString(),
                                  style: context.headline6,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => controller.onCreateTap(),
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
