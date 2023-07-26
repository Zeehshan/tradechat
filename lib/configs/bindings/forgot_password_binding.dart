import 'package:get/get.dart';
import '../../controllers/controllers.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
      permanent: false,
    );
  }
}
