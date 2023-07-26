import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';

class MyProductsController extends GetxController {
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;

  RxList<MyProductDataModel> products = <MyProductDataModel>[].obs;
  Rx<MyProductModel>? data;
  MyProductDataModel? selectedProduct;

  RxString searchQuery = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    getMyProducts();
    ever(manageUI, (value) {
      switch (value.uiAction.type) {
        case GetStateUIActionType.inProgress:
          LoaderDialog().loaderDialog();
          break;
        case GetStateUIActionType.completed:
          removeOverlay();
          // Alerts.snackBarSuccess(
          //     title: '', message: value.uiAction.message.toString());
          break;
        case GetStateUIActionType.navigateToBack:
          break;
        case GetStateUIActionType.navigateToNext:
          break;
        case GetStateUIActionType.failure:
          removeOverlay();
          // Alerts.snackBar(
          //     title: '', message: value.uiAction.message.toString());
          break;
        default:
      }
    });
  }

  getMyProducts() async {
    try {
      manageUI.value = GetStateManageUIModel.initial();
      final MyProductModel? response = await apiRepostory.myProducts();
      if (response != null) {
        logger.d('not null');
        products.value = [];
        products.addAll(response.products);
        logger.d(products.length);
        data = response.obs;
      }
      manageUI.value =
          manageUI.value.copyWith(uiStatus: GetStateUIStatus.loaded);
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiStatus: GetStateUIStatus.error,
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  delete(int id) async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));

      await apiRepostory.deleteProduct(id: id);
      products.removeWhere((element) => element.id == id);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Product has been deleted',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  seelectedProductForEdit(MyProductDataModel? p) async {
    selectedProduct = p;
    if (p != null) {
      await Get.toNamed(AppRoutes.addUpdateMyProduct);
      selectedProduct = null;
    }
  }

  searchProducts(String query) {
    // if (_products.isNotEmpty) {
    //   _products = products;
    // }
    // if (query.isEmpty) {
    //   products.value = _products;
    // } else {
    //   products.value = _products
    //       .where((p0) => query.toLowerCase().contains(p0.title.toLowerCase()))
    //       .toList();
    //   logger.d(products.length);
    // }
  }

  removeOverlay() {
    Get.back();
  }
}
