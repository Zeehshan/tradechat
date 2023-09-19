import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class NewPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewPaymentController());
  }
}
