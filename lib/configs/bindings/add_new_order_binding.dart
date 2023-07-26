import 'package:get/get.dart';
import 'package:tradechat/controllers/controllers.dart';

class AddnewOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewOrderController());
  }
}
