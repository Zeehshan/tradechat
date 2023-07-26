import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class AddMyProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddMyProductsController());
  }
}
