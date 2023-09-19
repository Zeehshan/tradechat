import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class AddnewOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewOrderController());
  }
}
