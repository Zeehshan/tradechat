import 'package:get/get.dart';

import '../data/providers/providers.dart';
import '../data/repositories/repositories.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class PaymentsController extends GetxController
    with StateMixin<List<PaymentModel>> {
  final GetConnectApiProvider _apiProvider = GetConnectApiProvider();
  final apiRepo = Get.find<AppApiRepostory>();
  List<PaymentModel> payments = [];
  @override
  void onInit() {
    super.onInit();
    loadPayments();
  }

  loadPayments() {
    _apiProvider.payments().then((response) {
      payments = response;
      change(payments, status: RxStatus.success());
    }, onError: (err) {
      logger.e(err);
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  addNewPayment(PaymentModel payment) {
    final pay =
        payments.firstWhereOrNull((element) => element.id == payment.id);
    if (pay != null) {
      final int index = payments.map((e) => e.id).toList().indexOf(payment.id);
      payments.removeAt(index);
      payments.insert(index, payment);
    } else {
      payments.insert(0, payment);
    }
    change(payments, status: RxStatus.success());
  }

  deletePayment(int id) async {
    payments.removeWhere((element) => element.id == id);
    change(payments, status: RxStatus.success());
    await apiRepo.deletePayment(id: id);
  }
}
