import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class PriceInputWidget extends StatefulWidget {
  const PriceInputWidget({super.key});

  @override
  State<PriceInputWidget> createState() => _PriceInputWidgetState();
}

class _PriceInputWidgetState extends State<PriceInputWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();

  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(
        text: myProductsController.selectedProduct?.price.toString());
    Future.delayed(const Duration(milliseconds: 500), () {
      priceChanged();
    });
    textEditingController.addListener(priceChanged);
  }

  void priceChanged() {
    controller.priceChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: 'Price',
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
      ),
    );
  }
}
