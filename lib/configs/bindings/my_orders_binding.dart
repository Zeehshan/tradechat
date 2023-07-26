import 'package:get/get.dart';
import '../../controllers/controllers.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => MyOrdersController(), permanent: true);
  }
}
