import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/tools.dart';

class FilesWidget extends StatefulWidget {
  const FilesWidget({super.key});

  @override
  State<FilesWidget> createState() => _FilesWidgetState();
}

class _FilesWidgetState extends State<FilesWidget> {
  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  final controller = Get.find<AddMyProductsController>();
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (myProductsController.selectedProduct?.image != null) {
        final lists =
            myProductsController.selectedProduct!.image!.split(',').toList();
        controller.oldImages(lists);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AddMyProductsController myProductsController =
        Get.find<AddMyProductsController>();
    return Row(
      children: [
        Container(
          width: 80,
          height: 90,
          margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: InkWell(
              onTap: () => myProductsController.pickImg(),
              child: const Icon(Icons.add)),
        ),
        Flexible(
            child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: myProductsController.localImages
                    .map((item) => Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: [
                                Image.network(
                                  Tools.displayImage(item),
                                  width: 80,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: IconButton(
                                        splashRadius: 10,
                                        constraints: const BoxConstraints(
                                            maxHeight: 30, maxWidth: 30),
                                        padding: EdgeInsets.zero,
                                        onPressed: () => myProductsController
                                            .removeLocalImg(item),
                                        icon: const Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
