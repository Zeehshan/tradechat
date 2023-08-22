import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../configs/routes/app_routes.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/tools.dart';
import '../../../widgets/widgets.dart';

class OrderWidget extends GetView<OrderDetailsController> {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(0, 0))
            ]),
        child: TextButton(
          onPressed: controller.isEditView.value != true
              ? null
              : () => Get.toNamed(AppRoutes.addNewOrder),
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<MyOrdersController>(builder: (myOrdersController) {
                String date = '';
                final DateTime messageData =
                    DateTime.parse(myOrdersController.slectedOrder!.createdAt);

                date =
                    '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NetworkImageWidget(
                            width: 80,
                            height: 80,
                            imageUrl: Tools.displayImage(
                                myOrdersController.slectedOrder?.image),
                            borderRadius: 2,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text.rich(TextSpan(
                                  text: 'Order name:',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  children: [
                                    TextSpan(
                                        text:
                                            ' ${myOrdersController.slectedOrder!.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(fontSize: 14))
                                  ])),
                              const SizedBox(
                                height: 4,
                              ),
                              Text.rich(TextSpan(
                                  text: 'Order#:',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  children: [
                                    TextSpan(
                                        text:
                                            ' ${myOrdersController.slectedOrder!.id}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(fontSize: 14))
                                  ])),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                );
              }),
              if (controller.isEditView.value)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                )
            ],
          ),
        )));
  }
}
