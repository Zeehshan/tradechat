import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class ButtonsWidget extends GetView<NewPaymentController> {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments as NewPaymentArguments?;
    return Obx(() => Column(
          children: [
            ElevatedButtonWidget(
                showProgressIndicator:
                    controller.manageUI.value.uiAction.type ==
                        GetStateUIActionType.inProgress,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: !controller.isFormValidated.value
                    ? null
                    : () => argument == null
                        ? controller.submittedForm()
                        : controller.editForm(),
                child: Text(
                  argument == null ? 'I have Paid' : 'Update',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white, fontSize: 14),
                )),
            ElevatedButtonWidget(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.transparent,
                borderSide: Theme.of(context).primaryColor,
                onPressed: controller.manageUI.value.uiAction.type ==
                        GetStateUIActionType.inProgress
                    ? null
                    : () => Get.back(),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).primaryColor, fontSize: 14),
                ))
          ],
        ));
  }
}
