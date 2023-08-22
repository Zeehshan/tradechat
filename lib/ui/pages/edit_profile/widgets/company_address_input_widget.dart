import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyAddressInputWidget extends StatefulWidget {
  const CompanyAddressInputWidget({super.key});

  @override
  State<CompanyAddressInputWidget> createState() =>
      _CompanyAddressInputWidgetState();
}

class _CompanyAddressInputWidgetState extends State<CompanyAddressInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.company.value.companyAddress);
    profileEditingController.cAddressChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cAddressChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny address',
      controller: editingController,
      required: true,
    );
  }
}
