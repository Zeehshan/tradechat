import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class LnameInputWidget extends StatefulWidget {
  const LnameInputWidget({super.key});

  @override
  State<LnameInputWidget> createState() => _LnameInputWidgetState();
}

class _LnameInputWidgetState extends State<LnameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.profile.value.user?.lastName);
    profileEditingController.lNameChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.lNameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Last name',
      controller: editingController,
      required: true,
    );
  }
}
