import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';

class GetUsersController extends GetxController {
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;
  RxList<UserModel> users = <UserModel>[].obs;
  Rx<UserModel>? data;
  UserModel? selectedUser;
  RxString searchQuery = ''.obs;

  RxBool loadmore = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getUsers();
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
    log(users.toString());
  }

  getUsers() async {
    try {
      manageUI.value = GetStateManageUIModel.initial();
      final UserModel? response = await apiRepostory.getUserDetials();
      if (response != null) {
        logger.d('not null');
        users.value = [];
        users.add(response);
        logger.d(users.length);
        data = response.obs;
      }
      manageUI.value =
          manageUI.value.copyWith(uiStatus: GetStateUIStatus.loaded);
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      manageUI.value = manageUI.value.copyWith(
          uiStatus: GetStateUIStatus.error,
          uiAction: GetStateUIActionModel(
              message: e.toString(), type: GetStateUIActionType.failure));
    }
  }

  loadMoreUsers() async {
    try {
      loadmore.value = true;
      final UserModel? response = await apiRepostory.getUserDetials();
      if (response != null) {
        users.add(response);
        logger.d(users.length);
        data = response.obs;
      }
      loadmore.value = false;
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      loadmore.value = false;
    }
  }

  delete(int id) async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));

      await apiRepostory.deleteUser(id: id);
      users.removeWhere((element) => element.id == id);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'User has been deleted',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  seelectedUserForEdit(UserModel? p) async {
    selectedUser = p;
    if (p != null) {
      await Get.toNamed(AppRoutes.addUpdateMyProduct);
      selectedUser = null;
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
