import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
