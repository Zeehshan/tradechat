import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../data/repositories/repositories.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalRepository>(
      LocalRepository(),
    );
    Get.put<UserRepository>(
      UserRepository(),
    );
    Get.put<AppApiRepostory>(
      AppApiRepostory(),
    );
    Get.put<MyOrdersController>(MyOrdersController(), permanent: true);
    Get.put<GetUsersController>(GetUsersController(), permanent: true);
    Get.put<AuthenticationController>(
      AuthenticationController(),
      permanent: true,
    );
  }
}
