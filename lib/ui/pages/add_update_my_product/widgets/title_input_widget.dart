import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class TitleInputWidget extends StatefulWidget {
  const TitleInputWidget({super.key});

  @override
  State<TitleInputWidget> createState() => _TitleInputWidgetState();
}

class _TitleInputWidgetState extends State<TitleInputWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();

  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(
        text: myProductsController.selectedProduct?.title);
    Future.delayed(const Duration(milliseconds: 500), () {
      titleChanged();
    });
    textEditingController.addListener(titleChanged);
  }

  void titleChanged() {
    controller.titleChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
            hintText: 'Title',
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
      ),
    );
  }
}
