import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class DeliveryCountryInputWidget extends StatefulWidget {
  const DeliveryCountryInputWidget({super.key});

  @override
  State<DeliveryCountryInputWidget> createState() =>
      _DeliveryCountryInputWidgetState();
}

class _DeliveryCountryInputWidgetState
    extends State<DeliveryCountryInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController(
        text: authController.company.value.deliveryCountry);
    profileEditingController.dCountryChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.dCountryChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Delivery country',
      controller: editingController,
    );
  }
}
