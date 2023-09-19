import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class AppbarWidget extends GetView<MyProductsController> {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xffededed),
      elevation: 3,
      title: Text(
        'Products',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: Obx(() => controller.searchQuery.isEmpty
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new),
            )
          : InkWell(
              onTap: () {
                if (controller.searchQuery.isNotEmpty) {
                  controller.searchProducts('');
                }
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new),
            )),
    );
  }
}
