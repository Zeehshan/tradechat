import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class LinkInputWidget extends StatefulWidget {
  const LinkInputWidget({super.key});

  @override
  State<LinkInputWidget> createState() => _LinkInputWidgetState();
}

class _LinkInputWidgetState extends State<LinkInputWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();

  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: myProductsController.selectedProduct?.link);
    Future.delayed(const Duration(milliseconds: 500), () {
      linkChanged();
    });
    textEditingController.addListener(linkChanged);
  }

  void linkChanged() {
    controller.linkChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
            hintText: 'Link',
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
      ),
    );
  }
}
