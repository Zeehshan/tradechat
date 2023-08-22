import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/controllers.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class InvoiceDetailsPage extends GetView<MyInvoicesController> {
  const InvoiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String date = '';
    final DateTime messageData =
        DateTime.parse(controller.selectedInvoice!.date);

    date =
        '${DateFormat.yMMMd().format(messageData)} ${DateFormat.jm().format(messageData)}';
    return Scaffold(
      appBar: AppBarWidget(
        backButtonCallback: () => Navigator.pop(context),
        title: Text.rich(TextSpan(
            text: 'Invoice #:',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 12),
            children: [
              TextSpan(
                  text: controller.selectedInvoice?.number.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 12))
            ])),
        actions: [
          Obx(() => IconButton(
              onPressed: controller.showEditView,
              icon: Icon(
                controller.isEditView.value
                    ? Icons.remove_red_eye_outlined
                    : Icons.edit,
                color: Colors.black,
              ))),
        ],
      ),
      body: ListView(
        children: [
          Obx(() => controller.isEditView.value
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text('PROFORMA INVOICE',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Invoice #: ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 14),
                            children: [
                              TextSpan(
                                  text: controller.selectedInvoice?.number
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14))
                            ]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text.rich(
                        TextSpan(
                            text: 'Issue date: ',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 14),
                            children: [
                              TextSpan(
                                  text: date,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14))
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
          const EditInvoiceWidget(),
          const SizedBox(
            height: 20,
          ),
          const ProductListWidget(),
          const ReferenceWidget(),
          const BankDetailsWidget(),
          const DeliveryAndPaymentDetailsWidget(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
