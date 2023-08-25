import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets.dart';

import '../../../../controllers/controllers.dart';

class ContactsListWidget extends GetView<GetUsersController> {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetUsersController());
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.users.length,
      itemBuilder: (context, index) {
        log(controller.users.toString());
        var data = controller.users[index];
        return ContactWidget(
            userName: data.username.toString(),
            image: data.profilePic.toString(),
            desc: data.personalWalletBalance.toString());
      },
    );
  }
}
