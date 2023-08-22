import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyZipInputWidget extends StatefulWidget {
  const CompanyZipInputWidget({super.key});

  @override
  State<CompanyZipInputWidget> createState() => _CompanyZipInputWidgetState();
}

class _CompanyZipInputWidgetState extends State<CompanyZipInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController =
        TextEditingController(text: authController.company.value.companyZip);
    profileEditingController.cZipChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cZipChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny zip',
      controller: editingController,
      required: true,
    );
  }
}
