// ignore_for_file: prefer_contains

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';
import 'controllers.dart';

class OrderDetailsController extends GetxController {
  final api = Get.find<AppApiRepostory>();

  final myOrdersController = Get.find<MyOrdersController>();

  final title = 'Settings'.obs;

  RxBool isEditView = false.obs;

  String quantity = '1';

  RxInt selectedProductId = 0.obs;

  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;

  RxMap<int, int> editAbleProducts = RxMap();

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
          Get.toNamed(AppRoutes.invoices);
          break;
        case GetStateUIActionType.navigateToBack:
          break;
        case GetStateUIActionType.navigateToNext:
          break;
        case GetStateUIActionType.failure:
          Get.back();
          break;
        default:
      }
    });
  }

  showEditView() {
    isEditView.value = isEditView.value ? false : true;
  }

  updateProducts(List<Map<String, int>> products, {bool delete = false}) async {
    try {
      selectedProductId.value = 0;
      quantity = '1';
      List<Map<String, int>> products0 = products;
      if (delete == false) {
        try {
          for (final p in myOrdersController.slectedOrder!.orderProducts) {
            if (products0
                    .map((e) => e['productId'])
                    .toList()
                    .indexOf(p.product!.id) !=
                -1) {
              logger.d({
                'productId': p.product!.id,
                'quantity': p.quantity +
                    (products0.firstWhere((element) =>
                            element['productId'] ==
                            p.product!.id)['quantity'] ??
                        0)
              });
              products0.firstWhere(
                  (e) => e['productId'] == p.product!.id)['quantity'] = p
                      .quantity +
                  (products0.firstWhere((element) =>
                          element['productId'] == p.product!.id)['quantity'] ??
                      0);
            } else {
              products0.add(
                {'productId': p.product!.id, 'quantity': p.quantity},
              );
            }
          }
        } catch (e) {
          //
        }
      }

      await api.orderProductsUpdate(
          id: myOrdersController.slectedOrder!.id, products: products0);
      try {
        final freshOrder = await api.getOrderDetials(
            orderId: myOrdersController.slectedOrder!.id.toString());
        if (freshOrder != null) {
          myOrdersController.updateOrder(freshOrder);
        }
      } catch (e) {
        logger.e('getOrderDetials error', e);
      }
    } catch (e) {
      logger.e('updateProducts error', e);
    }
  }

  updateQuantit(String value) {
    quantity = value;
  }

  selectedProducytId(int v) {
    selectedProductId.value = v;
  }

  createInvoice() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      await api.createInvoice(orderId: myOrdersController.slectedOrder!.id);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Invoice has been generated',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  updateQuantity(int id, int qty) {
    editAbleProducts[id] = qty;
  }
}
