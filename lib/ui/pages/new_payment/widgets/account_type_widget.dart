import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class AccountTypeWidget extends GetView<NewPaymentController> {
  const AccountTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 40,
          margin:
              const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Theme.of(context).colorScheme.background),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String?>(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              borderRadius: BorderRadius.circular(0),
              hint: Text(
                'Account Type',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              value: controller.accountType.value.isEmpty
                  ? null
                  : controller.accountType.value,
              onChanged: (String? value) {
                if (value != null) {
                  controller.accountTypeChanged(value);
                }
              },
              items: ['Personal Account', 'Company Account']
                  .map((e) => DropdownMenuItem<String?>(
                        value: e == 'Personal Account' ? 'personal' : 'company',
                        child: Text(e.toString()),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
