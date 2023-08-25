import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class MyProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUsersController());
  }
}
