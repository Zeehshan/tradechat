import 'package:get/get.dart';
import '../../controllers/controllers.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(
      EditProfileController(),
      permanent: false,
    );
  }
}
