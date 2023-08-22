import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../../utils/utils.dart';
import '../../../dialogs/dialogs.dart';
import '../../../widgets/widgets.dart';

class EditPicturewidget extends GetView<EditProfileController> {
  const EditPicturewidget({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthenticationController>();
    return Obx(() => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: 170,
              height: 170,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: controller.profilePic.value != ''
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(File(controller.profilePic.value)))
                    : NetworkImageWidget(
                        imageUrl: Tools.displayImage(
                            auth.profile.value.user?.profilePic),
                        borderRadius: 100,
                        width: 150,
                        height: 150,
                        userId: auth.profile.value.user!.id.toString(),
                        boxFit: BoxFit.fitWidth,
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      final source = await ImagePickerDialog.imagePickerDialog(
                          context: context);
                      controller.selectPhoto(imageSource: source);
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
