import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class QtyInputWidget extends StatefulWidget {
  const QtyInputWidget({super.key});

  @override
  State<QtyInputWidget> createState() => _QtyInputWidgetState();
}

class _QtyInputWidgetState extends State<QtyInputWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();

  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(
        text: myProductsController.selectedProduct?.quantity.toString());
    Future.delayed(const Duration(milliseconds: 500), () {
      qtyChanged();
    });
    textEditingController.addListener(qtyChanged);
  }

  void qtyChanged() {
    controller.qtyChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: 'Quantity',
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
      ),
    );
  }
}
