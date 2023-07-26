import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class OrdersWidget extends GetView<MyOrdersController> {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return OrderWidget(order: order);
          },
        ));
  }
}
