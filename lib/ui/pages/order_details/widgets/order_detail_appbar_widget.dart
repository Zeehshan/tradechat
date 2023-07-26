import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class MyOrderAppbarWidget extends GetView<OrderDetailsController> {
  const MyOrderAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      elevation: 3,
      title: Text(
        'Order#1231212121',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
      ),
      centerTitle: true,
      actions: [
        Obx(() => IconButton(
            onPressed: controller.showEditView,
            icon: Icon(
              controller.isEditView.value
                  ? Icons.remove_red_eye_outlined
                  : Icons.edit,
              color: Colors.black,
            ))),
      ],
    );
  }
}
