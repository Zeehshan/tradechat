import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class DeliveryAndPaymentDetailsWidget extends GetView<MyInvoicesController> {
  const DeliveryAndPaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => Column(
            children: [
              if (controller.isEditView.value)
                Row(
                  children: [
                    Text(
                      'Edit Delivery Term',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    const DeliveryTermDropDown(),
                  ],
                ),
              if (controller.isEditView.value)
                const SizedBox(
                  height: 20,
                ),
              if (controller.isEditView.value)
                Row(
                  children: [
                    Text(
                      'Edit Payment Term',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    const PaymentTermDropDown(),
                  ],
                ),
              if (!controller.isEditView.value)
                Text(
                  'Delivery Terms: ${controller.selectedInvoice!.deliveryTerm}',
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16),
                ),
              const SizedBox(
                height: 4,
              ),
              if (!controller.isEditView.value)
                Text(
                  'Payment Terms: ${controller.selectedInvoice!.paymentTerm}',
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16),
                ),
            ],
          ),
        ));
  }
}

class DeliveryTermDropDown extends GetView<MyInvoicesController> {
  const DeliveryTermDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyInvoicesController>(builder: (myInvoicesController) {
      return Container(
        height: 40,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border:
                Border.all(color: Theme.of(context).colorScheme.background)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(0),
            value: myInvoicesController.selectedInvoice!.deliveryTerm,
            onChanged: (value) {
              if (value != null) {
                final selectedInvoice = myInvoicesController.selectedInvoice!
                    .copyWith(deliveryTerm: value);
                myInvoicesController.updateInvoiceCalled(selectedInvoice);
                myInvoicesController.editNameCalled();
              }
            },
            padding: const EdgeInsets.symmetric(horizontal: 10),
            items: ['EX WORKS', 'FOB', 'CIF', 'CNF']
                .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(p),
                    ))
                .toList(),
          ),
        ),
      );
    });
  }
}

class PaymentTermDropDown extends GetView<MyInvoicesController> {
  const PaymentTermDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyInvoicesController>(builder: (myInvoicesController) {
      return Container(
        height: 40,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border:
                Border.all(color: Theme.of(context).colorScheme.background)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(0),
            value: myInvoicesController.selectedInvoice!.paymentTerm,
            onChanged: (value) {
              if (value != null) {
                final selectedInvoice = myInvoicesController.selectedInvoice!
                    .copyWith(paymentTerm: value);
                myInvoicesController.updateInvoiceCalled(selectedInvoice);
                myInvoicesController.editNameCalled();
              }
            },
            padding: const EdgeInsets.symmetric(horizontal: 10),
            items: ['By Bank', 'Cash', 'By Card']
                .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(p),
                    ))
                .toList(),
          ),
        ),
      );
    });
  }
}
