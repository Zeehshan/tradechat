import 'package:get/get.dart';

import '../../controllers/controllers.dart';

class ScaffoldNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScaffoldWithNavbarController());
  }
}
