import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import 'widgets.dart';

class ContactsListWidget extends GetView<UsersController> {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.state?.length ?? 0,
      itemBuilder: (context, index) {
        return ContactWidget(
          user: controller.state![index],
        );
      },
    );
  }
}
