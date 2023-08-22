import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';

class InvoiceListWidget extends GetView<MyInvoicesController> {
  const InvoiceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.invoices.length,
          itemBuilder: (context, index) {
            final item = controller.invoices[index];
            String date = '';
            final DateTime messageData = DateTime.parse(item.createdAt);

            date =
                '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () => controller.selectedInvoiceCalled(item),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(TextSpan(
                              text: 'Invoice #:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: item.number.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 12))
                              ])),
                          const SizedBox(
                            height: 6,
                          ),
                          Text.rich(TextSpan(
                              text: 'Amount:',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: item.total,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 12))
                              ])),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            date,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                    DropDownWidget(
                      onDelete: () {
                        Future.value()
                            .then((value) => controller.delete(item.id));
                      },
                      onEdit: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
