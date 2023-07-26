import 'package:get/get.dart';
import '../../controllers/controllers.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(
      SignupController(),
      permanent: false,
    );
  }
}
