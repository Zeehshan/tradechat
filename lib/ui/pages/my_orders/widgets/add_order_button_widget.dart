import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/app_routes.dart';
import '../../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';

class AddOrderButtonWidget extends StatelessWidget {
  const AddOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyOrdersController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: ElevatedButtonWidget(
        onPressed: () {
          controller.selectedOrder(null);
          Get.toNamed(AppRoutes.addNewOrder);
        },
        child: Text(
          'Add new order',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
