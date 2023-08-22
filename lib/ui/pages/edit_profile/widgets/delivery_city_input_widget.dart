import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class DeliveryCityInputWidget extends StatefulWidget {
  const DeliveryCityInputWidget({super.key});

  @override
  State<DeliveryCityInputWidget> createState() =>
      _DeliveryCityInputWidgetState();
}

class _DeliveryCityInputWidgetState extends State<DeliveryCityInputWidget> {
  late TextEditingController editingController;
  final authController = Get.find<AuthenticationController>();
  final profileEditingController = Get.find<EditProfileController>();

  @override
  void initState() {
    super.initState();
    editingController =
        TextEditingController(text: authController.company.value.deliveryCity);
    profileEditingController.dCityChaged(editingController.text);
    editingController.addListener(() {
      profileEditingController.dCityChaged(editingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextfieldWidget(
      hintText: 'Delivery city',
      controller: editingController,
    );
  }
}
