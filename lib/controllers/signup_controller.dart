import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repositories/repositories.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class SignupController extends GetxController {
  final UserRepository _userRepository = Get.find();
  final AuthenticationController _authenticationController = Get.find();
  RxBool isReady = false.obs;
  RxBool isSingupPressed = false.obs;

  Email email = Email.pure();
  Password password = const Password.pure();

  emailChanged(String value) {
    email = Email.dirty(value);
    logger.d(email.isValid);
    isReady.value = email.isValid && password.value.length > 5;
  }

  passwordChanged(String value) {
    password = Password.dirty(value);
    logger.d(password.isValid);
    isReady.value = email.isValid && password.value.length > 5;
  }

  singUp() async {
    try {
      isSingupPressed.value = true;
      await _userRepository.signup(
          email: email.value, password: password.value);
      isSingupPressed.value = false;
      _authenticationController.handleAuthenticationChanged(true);
    } catch (e) {
      isSingupPressed.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
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
