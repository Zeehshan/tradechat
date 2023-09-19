import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class AddMyProductsController extends GetxController {
  final LocalRepository localRepository = Get.find<LocalRepository>();
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;

  final MyProductsController myProductsController =
      Get.find<MyProductsController>();
  RxBool isReady = false.obs;
  RxBool isLoading = false.obs;
  RxList<String> localImages = const <String>[].obs;
  TextInput title = const TextInput.pure();
  TextInput link = const TextInput.pure();
  TextInput qty = const TextInput.pure();
  TextInput price = const TextInput.pure();
  TextInput description = const TextInput.pure();

  @override
  void onInit() async {
    super.onInit();
    ever(manageUI, (value) {
      switch (value.uiAction.type) {
        case GetStateUIActionType.inProgress:
          LoaderDialog().loaderDialog();
          break;
        case GetStateUIActionType.completed:
          Get.back();
          Alerts.snackBarSuccess(
              title: '', message: value.uiAction.message.toString());
          break;
        case GetStateUIActionType.navigateToBack:
          break;
        case GetStateUIActionType.navigateToNext:
          break;
        case GetStateUIActionType.failure:
          Get.back();
          // Alerts.snackBar(
          //     title: '', message: value.uiAction.message.toString());
          break;
        default:
      }
    });
  }

  pickImg() async {
    try {
      final image =
          await localRepository.pickImage(source: ImageSource.gallery);
      if (image != null) {
        manageUI.value = manageUI.value.copyWith(
            uiAction: const GetStateUIActionModel(
                type: GetStateUIActionType.inProgress));
        final file = await apiRepostory.uploadFile(localImg: image.path!);
        manageUI.value = manageUI.value.copyWith(
            uiAction: const GetStateUIActionModel(
                type: GetStateUIActionType.completed));
        if (file != null) {
          localImages.add(file);
        }
        _isReady();
      }
    } catch (error) {
      manageUI.value = manageUI.value.copyWith(
          uiAction:
              const GetStateUIActionModel(type: GetStateUIActionType.failure));
      // Alerts.snackBar(
      //     title: 'Image selection error', message: error.toString());
    }
  }

  removeLocalImg(String item) {
    localImages.remove(item);
    apiRepostory.deleteFile(name: item);
    _isReady();
  }

  titleChanged(String value) {
    title = TextInput.dirty(value);
    _isReady();
  }

  linkChanged(String value) {
    link = TextInput.dirty(value);
    _isReady();
  }

  qtyChanged(String value) {
    qty = TextInput.dirty(value);
    _isReady();
  }

  priceChanged(String value) {
    price = TextInput.dirty(value);
    _isReady();
  }

  descriptionChanged(String value) {
    logger.d('called');
    description = TextInput.dirty(value);
    _isReady();
  }

  oldImages(List<String> images) {
    localImages.value = images;
    _isReady();
  }

  _isReady() {
    isReady.value = localImages.isNotEmpty &&
        title.isValid &&
        link.isValid &&
        qty.isValid &&
        price.isValid &&
        description.isValid;
  }

  addData() async {
    try {
      isLoading.value = true;
      final p = await apiRepostory.addProduct(
          title: title.value,
          link: link.value,
          qty: qty.value,
          price: price.value,
          description: description.value,
          imgs: localImages);
      isLoading.value = false;
      Get.back(result: p);
      // Alerts.snackBarSuccess(
      //     title: 'Success', message: 'The product was added');
      myProductsController.getMyProducts();
    } catch (e) {
      isLoading.value = false;
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      Alerts.snackBar(title: 'Error', message: error.message.toString());
    }
  }

  updatedProduct() async {
    try {
      isLoading.value = true;
      await apiRepostory.editProduct(
          id: myProductsController.selectedProduct!.id,
          title: title.value,
          link: link.value,
          price: price.value,
          qty: qty.value,
          description: description.value,
          imgs: localImages);
      isLoading.value = false;
      myProductsController.getMyProducts();
      Get.back();
      Alerts.snackBarSuccess(
          title: 'Success', message: 'The product was edited');
    } catch (e) {
      isLoading.value = false;
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      Alerts.snackBar(title: 'Error', message: error.message.toString());
    }
  }
}
