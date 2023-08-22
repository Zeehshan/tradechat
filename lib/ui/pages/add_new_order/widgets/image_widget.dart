import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final myOrderController = Get.find<MyOrdersController>();
  final createPController = Get.put(CreateOrderController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      createPController.oldImageChanged(myOrderController.slectedOrder?.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(2),
              dashPattern: const [4, 4],
              color: ThemeConfig.primaryColor,
              strokeWidth: 2,
              child: InkWell(
                onTap: () => createPController.imageChanged(),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      child: createPController.image.value != ''
                          ? createPController.image.value.contains('user')
                              ? Center(
                                  child: Image.file(
                                      File(createPController.image.value)))
                              : NetworkImageWidget(
                                  borderRadius: 0,
                                  height: 200,
                                  width: double.infinity,
                                  boxFit: BoxFit.contain,
                                  imageUrl: Tools.displayImage(
                                      createPController.image.value))
                          : Center(
                              child: Text(
                                'Click to upload image',
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                    ),
                    if (createPController.image.value != '')
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: ElevatedButtonWidget(
                            width: 120,
                            height: 28,
                            borderRadius: 100,
                            child: const Text('Change Image'),
                            onPressed: () => createPController.imageChanged()),
                      ),
                  ],
                ),
              )),
        ));
  }
}
