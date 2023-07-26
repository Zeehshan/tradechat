import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../widgets/widgets.dart';

class AddInvoiceDialoig {
  static addInvoiceDialoig({required BuildContext context}) {
    return showGeneralDialog<dynamic>(
      barrierLabel: 'Label',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 100),
      context: context,
      pageBuilder: (context, anim1, anim2) => Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(child: AddInvoivewidgets()),
          )),
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }
}

class AddInvoivewidgets extends GetView<MyInvoicesController> {
  const AddInvoivewidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Generate Invoice for any user',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const DropDownWidget(),
        Obx(() => ElevatedButtonWidget(
            margin: const EdgeInsets.only(top: 20),
            onPressed: controller.orderId.value == 0
                ? null
                : () {
                    Navigator.pop(context);
                    controller.creaetInvoice();
                  },
            child: Text(
              'Create Invoice',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 14, color: Colors.white),
            ))),
        ElevatedButtonWidget(
            margin: const EdgeInsets.only(top: 20),
            borderWidth: 1.2,
            borderSide: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}

class DropDownWidget extends GetView<MyInvoicesController> {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Get.find<MyOrdersController>();
    return Obx(() => Container(
          height: 40,
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Theme.of(context).colorScheme.background),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int?>(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              borderRadius: BorderRadius.circular(0),
              value: controller.orderId.value == 0
                  ? null
                  : controller.orderId.value,
              onChanged: (int? value) {
                if (value != null) {
                  controller.selectedOrderId(value);
                }
              },
              items: orders.orders
                  .map((e) => DropdownMenuItem<int?>(
                        value: e.id,
                        child: Text(e.id.toString()),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
