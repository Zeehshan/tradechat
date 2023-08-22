import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../widgets/widgets.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class DropDownWidget extends GetView<OrderDetailsController> {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<MyProductsController>();

    return Obx(() => Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(0),
                    value: controller.selectedProductId.value == 0
                        ? null
                        : controller.selectedProductId.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedProducytId(value);
                      }
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    items: productsController.products
                        .map((p) => DropdownMenuItem(
                              value: p.id,
                              child: Text(
                                  '${p.title}-\$${NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format(p.price)}'),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            const QuantityInputWidget(),
            const SizedBox(
              width: 10,
            ),
            GetBuilder<MyOrdersController>(builder: (myOrdersController) {
              return ElevatedButtonWidget(
                  width: 35,
                  height: 35,
                  borderRadius: 100,
                  onPressed: controller.selectedProductId.value == 0
                      ? null
                      : () {
                          controller.updateProducts([
                            {
                              'productId': controller.selectedProductId.value,
                              'quantity': int.parse(controller.quantity)
                            }
                          ]);
                        },
                  child: const Icon(Icons.add));
            }),
            const SizedBox(
              width: 20,
            ),
          ],
        ));
  }
}
