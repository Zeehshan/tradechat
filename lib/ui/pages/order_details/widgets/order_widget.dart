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
    String date = '';
    final DateTime messageData = DateTime.now();

    date =
        '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Container(
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
          onPressed: () => Get.toNamed(AppRoutes.addNewOrder),
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NetworkImageWidget(
                          width: 80,
                          height: 80,
                          imageUrl: Tools.displayImage(controller
                              .myOrdersController.slectedOrder?.image),
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
                                style: Theme.of(context).textTheme.labelMedium,
                                children: [
                                  TextSpan(
                                      text: ' 323544',
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
                                style: Theme.of(context).textTheme.labelMedium,
                                children: [
                                  TextSpan(
                                      text: ' 8877658700',
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
              ),
              Obx(() => controller.isEditView.value
                  ? const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    )
                  : Container())
            ],
          ),
        ));
  }
}
