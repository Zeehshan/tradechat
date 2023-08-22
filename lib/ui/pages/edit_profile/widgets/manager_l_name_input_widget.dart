import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class ManagerLNameInputWidget extends StatefulWidget {
  const ManagerLNameInputWidget({super.key});

  @override
  State<ManagerLNameInputWidget> createState() =>
      _ManagerLNameInputWidgetState();
}

class _ManagerLNameInputWidgetState extends State<ManagerLNameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.company.value.managerLastName);
    profileEditingController.cMLnameChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cMLnameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Manager Last Name',
      controller: editingController,
      required: true,
    );
  }
}
