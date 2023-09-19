import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/dialogs.dart';
import '../utils/utils.dart';

class MyOrdersController extends GetxController {
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;

  RxList<OrderModel> orders = <OrderModel>[].obs;

  OrderModel? slectedOrder;

  String selectedOrderTotalPrice = '';

  RxInt orderId = (-1).obs;

  @override
  void onInit() async {
    super.onInit();
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

  myorders() async {
    try {
      manageUI.value = GetStateManageUIModel.initial();
      final orders0 = await apiRepostory.myOrders();
      orders.value = [];
      orders.addAll(orders0);
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

  insertOrder(OrderModel order) {
    orders.insert(0, order);
  }

  updateOrder(OrderModel order) {
    int index = orders.map((element) => element.id).toList().indexOf(order.id);
    orders.removeAt(index);
    orders.insert(index, order);
    slectedOrder = order;

    update();
    _totalPrice();
  }

  updateDocuments(int id) {
    int index = orders.map((element) => element.id).toList().indexOf(id);
    final order = orders[index];

    // apiRepostory.orderDocumentsUpdate(id: id, documents: documents);
  }

  deleteOrder(int id) async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      await apiRepostory.deleteOrder(orderId: id);
      orders.removeWhere((element) => element.id == id);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Order has been deleted',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  selectedOrder(OrderModel? order) async {
    slectedOrder = order;
    if (order != null) {
      selectedOrderTotalPrice = '';
      _totalPrice();

      await Get.toNamed(AppRoutes.myOrderDetails);
    }
  }

  updateOrderCalled(OrderModel? order) {
    slectedOrder = order;
  }

  removeOverlay() {
    Get.back();
  }

  _totalPrice() {
    try {
      List<int> prices = [];
      for (final p in slectedOrder!.orderProducts) {
        prices.add(p.quantity * p.product!.price);
      }
      int total = prices.reduce((a, b) => a + b);
      selectedOrderTotalPrice =
          NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
              .format(total);
      update();
    } catch (e) {
      ///
    }
  }

  addToOrder(MessageModel msg) async {
    final OrderModel order =
        orders.firstWhere((element) => element.id == orderId.value);
    List<dynamic> documents = [];
    if (order.documents['files'] != null) {
      documents = order.documents['files'].map((e) => e).toList();
    }
    documents.add({'file': msg.fileUrl.toString()});

    apiRepostory.orderDocumentsUpdate(
        id: orderId.value, documents: {'files': documents});
  }

  selectOrder(int order) {
    orderId.value = order;
  }
}
