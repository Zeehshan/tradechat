import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class CompanyCityInputWidget extends StatefulWidget {
  const CompanyCityInputWidget({super.key});

  @override
  State<CompanyCityInputWidget> createState() => _CompanyCityInputWidgetState();
}

class _CompanyCityInputWidgetState extends State<CompanyCityInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController =
        TextEditingController(text: authController.company.value.companyCity);
    profileEditingController.cCityChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.cCityChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Comapny city',
      controller: editingController,
      required: true,
    );
  }
}
