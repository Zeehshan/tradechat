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

  Future<UserModel?> getUsersDetials();
  Future<void> deleteUsers({required int id});

  Future orderProductsUpdate(
      {required int id, required List<Map<String, int>> products});

  Future<String?> uploadFile({required String localImg});

  Future deleteFile({required String name});

  Future<List<OrderModel>> myOrders();

  Future deleteOrder({required int orderId});

  Future<InvoiceModel> createInvoice({required int orderId});

  Future deleteInvoice({required int invoiceId});

  Future<List<InvoiceModel>> invoices();

  Future updateInvoice(
      {required int id, required Map<String, dynamic> invoice});
}
