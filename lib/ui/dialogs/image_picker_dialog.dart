import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog {
  static Future<ImageSource?> imagePickerDialog(
      {required BuildContext context}) async {
    if (Platform.isIOS) {
      return await showCupertinoModalPopup<dynamic>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => const CupertinoAlertDialog(
          content: Material(child: ImagePickerWidget()),
        ),
      );
    } else {
      return await showGeneralDialog<dynamic>(
        barrierLabel: 'Label',
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.8),
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (context, anim1, anim2) {
          return Dialog(
              insetPadding: const EdgeInsets.all(25),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: const SingleChildScrollView(child: ImagePickerWidget()));
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
            child: child,
          );
        },
      );
    }
  }
}

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            'Please select option',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () => Navigator.pop(context, ImageSource.camera),
                child: Text(
                  'Camera',
                  style: Theme.of(context).textTheme.labelMedium,
                )),
            TextButton(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: Text(
                'Gallary',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
