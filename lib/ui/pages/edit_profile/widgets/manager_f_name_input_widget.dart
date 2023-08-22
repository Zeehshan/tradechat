import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class ManagerFNameInputWidget extends StatefulWidget {
  const ManagerFNameInputWidget({super.key});

  @override
  State<ManagerFNameInputWidget> createState() =>
      _ManagerFNameInputWidgetState();
}

class _ManagerFNameInputWidgetState extends State<ManagerFNameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.company.value.managerFirstName);
    profileEditingController.cMFnameChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cMFnameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Manager First Name',
      controller: editingController,
      required: true,
    );
  }
}
