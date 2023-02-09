import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:queen/queen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('القوانين'),
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: controller.categories.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.90),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: context.height * 0.1,
                    width: context.width * 0.5,
                    child: Image.network(
                      controller.categories[index].image,
                    ),
                  ),
                  Text(
                    controller.categories[index].name,
                    style: context.headline6,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
