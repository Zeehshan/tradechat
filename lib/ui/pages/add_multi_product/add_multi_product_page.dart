import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart' as global;

import '../../../configs/themes/themes.dart';
import 'widgets/widgets.dart';

class AddMultiProductPage extends StatelessWidget {
  const AddMultiProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const AddMultiProductAppBarWidget(),
            const SliverToBoxAdapter(
              child: DropDownWidget(),
            ),
            const SliverToBoxAdapter(
              child: ProductListWidget(),
            ),
            GetBuilder<MyOrdersController>(builder: (myOrdersController) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, bottom: 40, top: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Total ¥${myOrdersController.selectedOrderTotalPrice}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
              );
            }),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: global.ElevatedButtonWidget(
                      borderSide: Theme.of(context).primaryColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      backgroundColor: Colors.white,
                      borderWidth: 1,
                      elevation: 0,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16, color: ThemeConfig.primaryColor),
                      ),
                    ),
                  ),
                  GetBuilder<MyOrdersController>(builder: (myOrdersController) {
                    return GetBuilder<OrderDetailsController>(
                        builder: (controller) {
                      return Expanded(
                        child: global.ElevatedButtonWidget(
                          borderSide: Theme.of(context).primaryColor,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          backgroundColor: Colors.white,
                          borderWidth: 1,
                          elevation: 0,
                          onPressed: () {
                            if (controller.editAbleProducts.isEmpty) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              final previousProducts = myOrdersController
                                  .slectedOrder!.orderProducts;
                              List<Map<String, int>> map = [];
                              for (final p in previousProducts) {
                                map.add({
                                  'productId': p.product!.id,
                                  'quantity': controller
                                          .editAbleProducts[p.product!.id] ??
                                      p.quantity
                                });
                              }
                              controller.updateProducts(map, delete: true);
                            }
                          },
                          child: Text(
                            'Save',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 16,
                                    color: ThemeConfig.primaryColor),
                          ),
                        ),
                      );
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
