import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool showPassword = false;
  late TextEditingController controller;
  LoginController loginController = Get.find<LoginController>();
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(_passwordChanged);
  }

  _passwordChanged() => loginController.passwordChanged(controller.text);

  _hideShowPasswordInput() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: !showPassword,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            splashColor: Colors.transparent,
            onTap: _hideShowPasswordInput,
            child: Padding(
              padding: const EdgeInsets.only(right: 14.5, left: 10.5),
              child: Icon(showPassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
            ),
          ),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 40, maxWidth: 50),
        ));
  }
}
