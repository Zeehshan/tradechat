import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/local_repository.dart';
import '../data/repositories/app_api_repository.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class CreateOrderController extends GetxController {
  final localRepository = Get.find<LocalRepository>();
  final AppApiRepostory appApiRepostory = Get.find<AppApiRepostory>();
  final authenticationController = Get.find<AuthenticationController>();
  final myOrdersController = Get.find<MyOrdersController>();
  RxString ordername = ''.obs;
  RxString image = ''.obs;

  RxBool isready = false.obs;

  RxBool isLoading = false.obs;

  ordernameChanged(String v) {
    ordername.value = v;
    _ready();
  }

  oldImageChanged(String? img) {
    image.value = img ?? '';
    _ready();
  }

  imageChanged() async {
    try {
      final i = await localRepository.pickImage(source: ImageSource.gallery);
      if (i?.path != null) {
        image.value = i!.path!;
        _ready();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  createOrder([String? id]) async {
    try {
      isLoading.value = true;
      final file = image.value.contains('user')
          ? await appApiRepostory.uploadFile(localImg: image.value)
          : image.value;
      if (file == null) {
        isLoading.value = false;
        Alerts.snackBar(
            title: 'Error!', message: 'Something went wrong try again');
      } else {
        final createdOrder = await appApiRepostory.createOrder(
            orderId: id, name: ordername.value, img: file);
        isLoading.value = false;
        Get.back();
        // Alerts.snackBarSuccess(title: 'Success', message: 'Order was created');
        if (id == null) {
          myOrdersController.insertOrder(createdOrder);
        } else {
          myOrdersController.updateOrder(createdOrder);
        }
      }
    } catch (e) {
      isLoading.value = false;
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      Alerts.snackBar(title: 'Error', message: error.message.toString());
    }
  }

  _ready() {
    isready.value = image.value != '' && ordername.value.isNotEmpty;
  }
}
