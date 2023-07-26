import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class DescriptionInputWidget extends StatefulWidget {
  const DescriptionInputWidget({super.key});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();

  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(
        text: myProductsController.selectedProduct?.description);
    Future.delayed(const Duration(milliseconds: 500), () {
      descriptionChanged();
    });
    textEditingController.addListener(descriptionChanged);
  }

  void descriptionChanged() {
    controller.descriptionChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
            hintText: 'Description',
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
      ),
    );
  }
}
