import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import 'widgets.dart';

class FnameInputWidget extends StatefulWidget {
  const FnameInputWidget({super.key});

  @override
  State<FnameInputWidget> createState() => _FnameInputWidgetState();
}

class _FnameInputWidgetState extends State<FnameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.profile.value.user?.firstName);

    profileEditingController.fNameChaged(editingController.text);

    editingController.addListener(() {
      profileEditingController.fNameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'First name',
      controller: editingController,
      required: true,
    );
  }
}
