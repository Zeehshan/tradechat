import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../pages.dart';

class InputNameWidget extends StatefulWidget {
  const InputNameWidget({super.key});

  @override
  State<InputNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends State<InputNameWidget> {
  late TextEditingController textEditingController;
  final argument = Get.arguments as NewPaymentArguments?;
  final newPController = Get.put(NewPaymentController());
  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: argument?.payment.senderName);
    Future.delayed(const Duration(milliseconds: 500), () {
      _emailChanged();
    });
    textEditingController.addListener(_emailChanged);
  }

  _emailChanged() =>
      newPController.senderNameChanged(textEditingController.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: textEditingController,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Sender name',
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
