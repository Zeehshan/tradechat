import 'package:get/get.dart';

import 'controllers.dart';

class OrderDetailsController extends GetxController {
  final myOrdersController = Get.find<MyOrdersController>();

  final title = 'Settings'.obs;

  RxBool isEditView = false.obs;

  showEditView() {
    isEditView.value = isEditView.value ? false : true;
  }
}
