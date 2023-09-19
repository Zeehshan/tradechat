import '../../models/models.dart';
import '../providers/providers.dart';

class AppApiRepostory {
  final AppApiProvider apiProvider;
  AppApiRepostory() : apiProvider = AppApiHttpProvider();

  Future<MyProductDataModel> addProduct(
      {required String title,
      required String link,
      required String qty,
      required String price,
      required String description,
      required List<String> imgs}) async {
    try {
      return await apiProvider.addProduct(
          title: title,
          link: link,
          qty: qty,
          price: price,
          description: description,
          imgs: imgs);
    } catch (e) {
      rethrow;
    }
  }

  Future<MyProductModel?> myProducts({int currentPage = 1}) async {
    try {
      return await apiProvider.myProducts(currentPage: currentPage);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProduct({required int id}) async {
    try {
      await apiProvider.deleteProduct(id: id);
    } catch (e) {
      rethrow;
    }
  }

  Future editProduct(
      {required int id,
      String? title,
      String? link,
      String? qty,
      String? price,
      String? description,
      List<String>? imgs}) async {
    try {
      await apiProvider.editProduct(
          id: id,
          title: title,
          link: link,
          qty: qty,
          price: price,
          imgs: imgs,
          description: description);
    } catch (e) {
      rethrow;
    }
  }

  Future createOrder(
      {String? orderId, required String name, required String img}) async {
    try {
      return await apiProvider.createOrder(
          orderId: orderId, name: name, img: img);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadFile(
      {required String localImg,
      Function(String file, double progress)? onReceiveProgress}) async {
    try {
      return await apiProvider.uploadFile(
          localImg: localImg, onReceiveProgress: onReceiveProgress);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrderModel>> myOrders() async {
    try {
      return await apiProvider.myOrders();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteOrder({required int orderId}) async {
    try {
      return await apiProvider.deleteOrder(orderId: orderId);
    } catch (e) {
      rethrow;
    }
  }

  Future<InvoiceModel> createInvoice({required int orderId}) async {
    try {
      return await apiProvider.createInvoice(orderId: orderId);
    } catch (e) {
      rethrow;
    }
  }

  Future deleteInvoice({required int invoiceId}) async {
    try {
      return await apiProvider.deleteInvoice(invoiceId: invoiceId);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<InvoiceModel>> invoices() async {
    try {
      return await apiProvider.invoices();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteFile({required String name}) async {
    try {
      await apiProvider.deleteFile(name: name);
    } catch (e) {
      rethrow;
    }
  }

  Future orderProductsUpdate(
      {required int id, required List<Map<String, int>> products}) async {
    try {
      await apiProvider.orderProductsUpdate(id: id, products: products);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel?> getOrderDetials({
    String? orderId,
  }) async {
    try {
      return await apiProvider.getOrderDetials(orderId: orderId);
    } catch (e) {
      rethrow;
    }
  }

  Future updateInvoice(
      {required int id, required Map<String, dynamic> invoice}) async {
    try {
      return await apiProvider.updateInvoice(id: id, invoice: invoice);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> createChat({required int id}) async {
    try {
      return await apiProvider.createChat(id: id);
    } catch (e) {
      rethrow;
    }
  }

  Future orderDocumentsUpdate(
      {required int id, required Map<String, dynamic> documents}) async {
    try {
      return await apiProvider.orderDocumentsUpdate(
          id: id, documents: documents);
    } catch (e) {
      rethrow;
    }
  }

  Future addNewPayment(
      {required int amount,
      required String senderName,
      required int orderNumber,
      required int accountNumber,
      required String accountType,
      required String image}) async {
    try {
      return await apiProvider.addNewPayment(
          amount: amount,
          senderName: senderName,
          orderNumber: orderNumber,
          accountNumber: accountNumber,
          accountType: accountType,
          image: image);
    } catch (e) {
      rethrow;
    }
  }

  Future updatePayment({
    required int id,
    required int amount,
    required String senderName,
    required int orderNumber,
    required int accountNumber,
    required String accountType,
  }) async {
    try {
      return await apiProvider.updatePayment(
          id: id,
          amount: amount,
          senderName: senderName,
          orderNumber: orderNumber,
          accountNumber: accountNumber,
          accountType: accountType);
    } catch (e) {
      rethrow;
    }
  }

  Future deletePayment({required int id}) async {
    try {
      return await apiProvider.deletePayment(id: id);
    } catch (e) {
      rethrow;
    }
  }

  Future confirmAmount({required int amount, required int id}) async {
    try {
      return await apiProvider.confirmAmount(amount: amount, id: id);
    } catch (e) {
      rethrow;
    }
  }

  Future deleteChat({required int id}) async {
    try {
      return await apiProvider.deleteChat(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
