import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../pages.dart';

class InputAmountWidget extends StatefulWidget {
  const InputAmountWidget({super.key});

  @override
  State<InputAmountWidget> createState() => _InputAmountWidgetState();
}

class _InputAmountWidgetState extends State<InputAmountWidget> {
  late TextEditingController textEditingController;
  final argument = Get.arguments as NewPaymentArguments?;
  final newPController = Get.put(NewPaymentController());
  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: argument?.payment.amount.toString());
    Future.delayed(const Duration(milliseconds: 500), () {
      _emailChanged();
    });
    textEditingController.addListener(_emailChanged);
  }

  _emailChanged() => newPController.amountChanged(textEditingController.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: textEditingController,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Amount',
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
