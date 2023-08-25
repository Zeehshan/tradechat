import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class GetUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUsersController());
  }
}
