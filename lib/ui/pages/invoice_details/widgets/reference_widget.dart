import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/controllers.dart';

class ReferenceWidget extends GetView<MyInvoicesController> {
  const ReferenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String date = '';
    final DateTime messageData =
        DateTime.parse(controller.selectedInvoice!.createdAt);

    date =
        '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (controller.isEditView.value)
                Row(
                  children: [
                    Text(
                      'Display Reference in View Mode',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 16),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                        value: controller.showReferenceMode.value,
                        onChanged: (v) => controller.showReferenceModeCalled()),
                  ],
                ),
              if (controller.showReferenceMode.value)
                Text(
                  'Reference: Test',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16),
                ),
              const SizedBox(
                height: 8,
              ),
              if (controller.showReferenceMode.value)
                Text(
                  date,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
            ],
          )),
    );
  }
}
