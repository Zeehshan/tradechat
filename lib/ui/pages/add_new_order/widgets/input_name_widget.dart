import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';

class InputNameWidget extends StatefulWidget {
  const InputNameWidget({super.key});

  @override
  State<InputNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends State<InputNameWidget> {
  late TextEditingController textEditingController;
  final muyOrderController = Get.find<MyOrdersController>();
  final createPController = Get.put(CreateOrderController());
  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: muyOrderController.slectedOrder?.name);
    Future.delayed(const Duration(milliseconds: 500), () {
      _emailChanged();
    });
    textEditingController.addListener(_emailChanged);
  }

  _emailChanged() =>
      createPController.ordernameChanged(textEditingController.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: textEditingController,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Order name',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(
              color: ThemeConfig.primaryColor,
              width: 1.2,
            ),
          ),
          focusColor: ThemeConfig.primaryColor,
        ),
      ),
    );
  }
}
