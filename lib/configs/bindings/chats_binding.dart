import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsController());
  }
}
