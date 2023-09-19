import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

class DocumentUploadWidget extends GetView<NewPaymentController> {
  const DocumentUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments as NewPaymentArguments?;
    if (argument != null) {
      return Container();
    }
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload payment proof',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(2),
                  dashPattern: const [4, 4],
                  color: ThemeConfig.primaryColor,
                  strokeWidth: 2,
                  child: InkWell(
                    onTap: () => controller.imageChanged(),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 200,
                          child: controller.image.value != ''
                              ? Center(
                                  child:
                                      Image.file(File(controller.image.value)))
                              : Center(
                                  child: Text(
                                    'Click to upload a file',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                        ),
                        if (controller.image.value != '')
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: ElevatedButtonWidget(
                                width: 120,
                                height: 28,
                                borderRadius: 100,
                                child: const Text('Change Image'),
                                onPressed: () => controller.imageChanged()),
                          ),
                      ],
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Text(
                  '*Disclaimer: please only upload confirmed transfers, this will enable us to process your order fast',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.red, fontSize: 14),
                ),
              ),
            ],
          ),
        ));
  }
}
