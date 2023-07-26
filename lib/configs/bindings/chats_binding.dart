import 'package:get/get.dart';
import 'package:tradechat/controllers/controllers.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatsController());
  }
}
