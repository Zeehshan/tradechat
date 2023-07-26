import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';
import 'widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final createPController = Get.put(CreateOrderController());
    final myOrderController = Get.find<MyOrdersController>();
    return CustomScrollView(
      slivers: [
        const NewOrderAppbarWidget(),
        const SliverToBoxAdapter(
          child: InputNameWidget(),
        ),
        const SliverToBoxAdapter(
          child: ImageWidget(),
        ),
        Obx(() => SliverToBoxAdapter(
              child: ElevatedButtonWidget(
                showProgressIndicator: createPController.isLoading.value,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                onPressed: createPController.isready.value
                    ? () => createPController.createOrder(
                        myOrderController.slectedOrder?.id.toString())
                    : null,
                child: Text(
                  myOrderController.slectedOrder == null ? 'Create' : 'Update',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            )),
        if (myOrderController.slectedOrder == null)
          SliverToBoxAdapter(
            child: ElevatedButtonWidget(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              onPressed: () {},
              child: Text(
                'Add Products',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        SliverToBoxAdapter(
          child: ElevatedButtonWidget(
            borderSide: Theme.of(context).primaryColor,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            backgroundColor: Colors.white,
            borderWidth: 1,
            elevation: 0,
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16, color: ThemeConfig.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
