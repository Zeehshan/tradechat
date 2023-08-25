import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../data/repositories/repositories.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository = Get.find();
  final AuthenticationController _authenticationController = Get.find();
  SecureStorage secureStorage = SecureStorage();
  RxBool isReady = false.obs;
  RxBool isLoginPressed = false.obs;
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

  loggedIn() async {
    try {
      isLoginPressed.value = true;
      await _userRepository.login(email: email.value, password: password.value);
      isLoginPressed.value = false;
      _authenticationController.handleAuthenticationChanged(true);
    } catch (e) {
      isLoginPressed.value = false;
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      Alerts.snackBar(title: 'Error', message: e.toString());
    }
  }
}
