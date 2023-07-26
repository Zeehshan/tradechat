import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static snackBar({required String title, required String message}) {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.BOTTOM, // Set the position of the SnackBar
      // Set the duration for how long the SnackBar will be visible
      backgroundColor: Colors.blueGrey,
      messageText: Text(
        message,
        style: Get.textTheme.titleSmall!
            .copyWith(color: Colors.white, fontSize: 13),
      ),

      borderRadius: 10.0, // Set the border radius of the SnackBar
      margin: const EdgeInsets.all(10.0), // Set the margin around the SnackBar
      isDismissible:
          true, // Set whether the SnackBar can be dismissed by tapping outside or not
      forwardAnimationCurve:
          Curves.easeOut, // Set the animation curve for showing the SnackBar
      reverseAnimationCurve:
          Curves.easeIn, // Set the animation curve for dismissing the SnackBar
      // You can also add optional parameters like icon, mainButton, etc.
      // Check the documentation for more customization options
    );
  }

  static snackBarSuccess({required String title, required String message}) {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      // Set the duration for how long the SnackBar will be visible
      backgroundColor: Colors.green,
      messageText: Text(
        message,
        style: Get.textTheme.titleSmall!
            .copyWith(color: Colors.white, fontSize: 13),
      ),

      borderRadius: 10.0, // Set the border radius of the SnackBar
      margin: const EdgeInsets.all(10.0), // Set the margin around the SnackBar
      isDismissible:
          true, // Set whether the SnackBar can be dismissed by tapping outside or not
      forwardAnimationCurve:
          Curves.easeOut, // Set the animation curve for showing the SnackBar
      reverseAnimationCurve:
          Curves.easeIn, // Set the animation curve for dismissing the SnackBar
      // You can also add optional parameters like icon, mainButton, etc.
      // Check the documentation for more customization options
    );
  }
}
