import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class PhoneInputWidget extends StatefulWidget {
  const PhoneInputWidget({super.key});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.profile.value.user?.phoneNumber);
    profileEditingController.phioneNumberChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.phioneNumberChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Phone number',
      controller: editingController,
      required: true,
      keyboardType: TextInputType.number,
    );
  }
}
