import 'package:get/get.dart';
import '../../controllers/controllers.dart';

class SocketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SocketController>(
      SocketController(),
      permanent: true,
    );
  }
}
