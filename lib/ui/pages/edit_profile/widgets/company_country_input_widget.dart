import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyCountryInputWidget extends StatefulWidget {
  const CompanyCountryInputWidget({super.key});

  @override
  State<CompanyCountryInputWidget> createState() =>
      _CompanyCountryInputWidgetState();
}

class _CompanyCountryInputWidgetState extends State<CompanyCountryInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.company.value.companyCountry);
    profileEditingController.cCountryChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cCountryChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny country',
      controller: editingController,
      required: true,
    );
  }
}
