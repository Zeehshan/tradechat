import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class UsernameInputWidget extends StatefulWidget {
  const UsernameInputWidget({super.key});

  @override
  State<UsernameInputWidget> createState() => _UsernameInputWidgetState();
}

class _UsernameInputWidgetState extends State<UsernameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.profile.value.user?.username);
    profileEditingController.usernameChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.usernameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Username',
      controller: editingController,
      required: true,
    );
  }
}
