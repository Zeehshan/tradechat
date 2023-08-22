import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyPhoneInputWidget extends StatefulWidget {
  const CompanyPhoneInputWidget({super.key});

  @override
  State<CompanyPhoneInputWidget> createState() =>
      _CompanyPhoneInputWidgetState();
}

class _CompanyPhoneInputWidgetState extends State<CompanyPhoneInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController =
        TextEditingController(text: authController.company.value.companyPhone);
    profileEditingController.cPhioneNumberChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cPhioneNumberChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny phone number',
      controller: editingController,
      required: true,
      keyboardType: TextInputType.number,
    );
  }
}
