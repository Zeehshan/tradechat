import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repositories/repositories.dart';
import '../utils/utils.dart';

class ForgotPasswordController extends GetxController {
  final UserRepository _userRepository = Get.find();
  RxBool isReady = false.obs;
  RxBool isForgotPasswordPressed = false.obs;

  Email email = Email.pure();

  emailChanged(String value) {
    email = Email.dirty(value);
    logger.d(email.isValid);
    isReady.value = email.isValid;
  }

  forgot() async {
    try {
      isForgotPasswordPressed.value = true;
      await _userRepository.forgotPassword(email: email.value);
      isForgotPasswordPressed.value = false;
    } catch (e) {
      isForgotPasswordPressed.value = false;
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      Get.snackbar(
        'Error',
        error.message.toString(),
        snackPosition: SnackPosition.BOTTOM, // Set the position of the SnackBar
        duration: const Duration(
            seconds:
                3), // Set the duration for how long the SnackBar will be visible
        backgroundColor:
            Colors.blueGrey, // Set the background color of the SnackBar
        colorText: Colors.white, // Set the text color of the SnackBar
        borderRadius: 10.0, // Set the border radius of the SnackBar
        margin:
            const EdgeInsets.all(10.0), // Set the margin around the SnackBar
        isDismissible:
            true, // Set whether the SnackBar can be dismissed by tapping outside or not
        forwardAnimationCurve:
            Curves.easeOut, // Set the animation curve for showing the SnackBar
        reverseAnimationCurve: Curves
            .easeIn, // Set the animation curve for dismissing the SnackBar
        // You can also add optional parameters like icon, mainButton, etc.
        // Check the documentation for more customization options
      );
    }
  }
}
