import '../../../models/models.dart';

abstract class AppApiProvider {
  Future<MyProductDataModel> addProduct(
      {required String title,
      required String link,
      required String qty,
      required String price,
      required String description,
      required List<String> imgs});

  Future<MyProductModel?> myProducts({int currentPage = 1});

  Future<void> deleteProduct({required int id});

  Future editProduct(
      {required int id,
      String? title,
      String? link,
      String? qty,
      String? price,
      String? description,
      List<String>? imgs});

  Future<OrderModel?> createOrder(
      {String? orderId, required String name, required String img});

  Future<OrderModel?> getOrderDetials({
    String? orderId,
  });

  Future orderProductsUpdate(
      {required int id, required List<Map<String, int>> products});

  Future orderDocumentsUpdate(
      {required int id, required Map<String, dynamic> documents});

  Future<String?> uploadFile(
      {required String localImg,
      Function(String file, double progress)? onReceiveProgress});

  Future deleteFile({required String name});

  Future<List<OrderModel>> myOrders();

  Future deleteOrder({required int orderId});

  Future<InvoiceModel> createInvoice({required int orderId});

  Future deleteInvoice({required int invoiceId});

  Future<List<InvoiceModel>> invoices();

  Future updateInvoice(
      {required int id, required Map<String, dynamic> invoice});

  Future<int> createChat({required int id});

  Future addNewPayment(
      {required int amount,
      required String senderName,
      required int orderNumber,
      required int accountNumber,
      required String accountType,
      required String image});

  Future updatePayment({
    required int id,
    required int amount,
    required String senderName,
    required int orderNumber,
    required int accountNumber,
    required String accountType,
  });
  Future deletePayment({required int id});

  Future deleteChat({required int id});

  Future<PaymentModel> confirmAmount({required int amount, required int id});
}
