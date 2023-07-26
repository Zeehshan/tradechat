import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/routes/app_routes.dart';
import '../../../controllers/controllers.dart';
import '../../../utils/enums.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<MyProductsController>(
            init: MyProductsController(),
            initState: (state) {},
            builder: (MyProductsController controller) {
              if (controller.manageUI.value.uiStatus ==
                  GetStateUIStatus.loading) {
                return const LoadingWidget();
              }
              return CustomScrollView(
                slivers: [
                  const AppbarWidget(),
                  SliverToBoxAdapter(
                    child: ElevatedButtonWidget(
                        height: 42,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '+ Add New',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () =>
                            Get.toNamed(AppRoutes.addUpdateMyProduct)),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: SearchWidget(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: ProductsWidget(),
                  )
                ],
              );
            }),
      ),
    );
  }
}
