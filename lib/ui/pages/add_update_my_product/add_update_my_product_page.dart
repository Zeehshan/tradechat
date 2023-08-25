import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class AddUpdteMyProductPage extends StatelessWidget {
  const AddUpdteMyProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GetUsersController myProductsController =
        Get.find<GetUsersController>();
    return Scaffold(
      body: GetX<AddMyProductsController>(
          init: AddMyProductsController(),
          builder: (controller) {
            return IgnorePointer(
              ignoring: controller.isLoading.value,
              child: CustomScrollView(
                slivers: [
                  SliverAppbarWidget(
                    title: myProductsController.selectedUser != null
                        ? 'Update product'
                        : 'Add new product',
                  ),
                  const SliverToBoxAdapter(
                    child: TitleInputWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: LinkInputWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: QtyInputWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: PriceInputWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: DescriptionInputWidget(),
                  ),
                  const SliverToBoxAdapter(
                    child: FilesWidget(),
                  ),
                  SliverFillRemaining(
                    child: Center(
                      child: ElevatedButtonWidget(
                        showProgressIndicator: controller.isLoading.value,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: !controller.isReady.value
                            ? null
                            : () => myProductsController.selectedUser != null
                                ? controller.updatedProduct()
                                : controller.addData(),
                        child: Text(
                          myProductsController.selectedUser != null
                              ? 'Update'
                              : 'Save',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
