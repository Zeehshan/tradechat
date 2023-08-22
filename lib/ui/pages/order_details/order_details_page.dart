import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/routes/app_routes.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class OrderDetailsPage extends GetView<OrderDetailsController> {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MyOrderAppbarWidget(),
          const SliverToBoxAdapter(
            child: OrderWidget(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 17,
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() => !controller.isEditView.value
                ? Container()
                : ElevatedButtonWidget(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: Text(
                      'Create and add single product to oerder tool',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () async {
                      final MyProductDataModel data =
                          await Get.toNamed(AppRoutes.addUpdateMyProduct);
                      final products = [
                        {'productId': data.id, 'quantity': data.quantity},
                      ];
                      controller.updateProducts(products);
                    },
                  )),
          ),
          SliverToBoxAdapter(
            child: Obx(() => !controller.isEditView.value
                ? Container()
                : ElevatedButtonWidget(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    child: Text(
                      'Add and edit multiple products tool',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.addMultiProduct),
                  )),
          ),
          SliverToBoxAdapter(
            child: ElevatedButtonWidget(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Text(
                'Generate Invoice',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                try {
                  controller.createInvoice();
                } catch (e) {
                  //
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Order Product List',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.timer,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Order waiting for confirmation'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: ProductListWidget(),
          )
        ],
      ),
    );
  }
}
