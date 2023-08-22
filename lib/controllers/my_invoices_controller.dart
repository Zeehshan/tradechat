import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../configs/routes/app_routes.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../ui/dialogs/loader_dialog.dart';
import '../utils/utils.dart';

class MyInvoicesController extends GetxController {
  final AppApiRepostory apiRepostory = Get.find<AppApiRepostory>();
  Rx<GetStateManageUIModel> manageUI = GetStateManageUIModel.initial().obs;
  RxBool isEditView = false.obs;
  RxBool showReferenceMode = true.obs;
  RxList<InvoiceModel> invoices = <InvoiceModel>[].obs;

  RxInt orderId = 0.obs;
  InvoiceModel? selectedInvoice;
  String selectedOrderTotalPrice = '';

  @override
  void onInit() async {
    super.onInit();
    getInvoices();
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

  getInvoices() async {
    try {
      manageUI.value = GetStateManageUIModel.initial();
      final List<InvoiceModel> invoices0 = await apiRepostory.invoices();
      invoices.addAll(invoices0);
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
      await apiRepostory.deleteInvoice(invoiceId: id);
      invoices.removeWhere((element) => element.id == id);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Invoice has been deleted',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }

  selectedOrderId(int id) {
    orderId.value = id;
  }

  creaetInvoice() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      final invoice = await apiRepostory.createInvoice(orderId: orderId.value);
      invoices.insert(0, invoice);
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              message: 'Invoice has been created',
              type: GetStateUIActionType.completed));
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: e.toString(), type: GetStateUIActionType.failure));
    }
  }

  selectedInvoiceCalled(InvoiceModel? invoice) async {
    selectedInvoice = invoice;
    if (invoice != null) {
      _totalPrice();
      await Get.toNamed(AppRoutes.invoiceDetails);
    }
  }

  updateInvoiceCalled(InvoiceModel invoice) {
    selectedInvoice = invoice;
    update();
  }

  removeOverlay() {
    Get.back();
  }

  _totalPrice() {
    List<int> prices = [];
    for (final p in selectedInvoice!.bundle!.orderProducts) {
      prices.add(p.quantity * p.product!.price);
    }
    int total = prices.reduce((a, b) => a + b);
    selectedOrderTotalPrice =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(total);
    logger.d(selectedOrderTotalPrice);
    update();
  }

  showEditView() {
    isEditView.value = isEditView.value ? false : true;
  }

  showReferenceModeCalled() {
    showReferenceMode.value = showReferenceMode.value ? false : true;
  }

  //////
  ///
  ///
  ///
  editNameCalled() async {
    try {
      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.inProgress));
      await apiRepostory.updateInvoice(
          id: selectedInvoice!.id, invoice: selectedInvoice!.toJson());

      manageUI.value = manageUI.value.copyWith(
          uiAction: const GetStateUIActionModel(
              type: GetStateUIActionType.completed));
      final int index =
          invoices.map((e) => e.id).toList().indexOf(selectedInvoice!.id);
      invoices.removeAt(index);
      invoices.insert(index, selectedInvoice!);
    } catch (e) {
      logger.e(runtimeType, '${e.runtimeType}::${e.toString()}');
      final error = e as DioException;
      manageUI.value = manageUI.value.copyWith(
          uiAction: GetStateUIActionModel(
              message: error.message, type: GetStateUIActionType.failure));
    }
  }
}
