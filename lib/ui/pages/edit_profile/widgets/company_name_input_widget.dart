import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyNameInputWidget extends StatefulWidget {
  const CompanyNameInputWidget({super.key});

  @override
  State<CompanyNameInputWidget> createState() => _CompanyNameInputWidgetState();
}

class _CompanyNameInputWidgetState extends State<CompanyNameInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController =
        TextEditingController(text: authController.company.value.companyName);
    profileEditingController.cNameChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cNameChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny name',
      controller: editingController,
      required: true,
    );
  }
}
