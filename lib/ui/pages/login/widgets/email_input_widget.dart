import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({super.key});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  late TextEditingController controller;
  LoginController loginController = Get.find<LoginController>();
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(_emailChanged);
  }

  _emailChanged() => loginController.emailChanged(controller.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
    );
  }
}
