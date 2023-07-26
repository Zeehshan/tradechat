import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/utils.dart';
import 'widgets/widgets.dart';

import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => controller.manageUI.value.uiStatus == GetStateUIStatus.loading
            ? const LoadingWidget()
            : const CustomScrollView(
                slivers: [
                  MyOrderAppbarWidget(),
                  SliverToBoxAdapter(
                    child: AddOrderButtonWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: OrdersWidget(),
                  )
                ],
              ));
  }
}
