import '../../models/models.dart';
import '../providers/providers.dart';

class AppApiRepostory {
  final AppApiProvider apiProvider;
  AppApiRepostory() : apiProvider = AppApiHttpProvider();

  Future addProduct(
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

  Future<MyProductModel?> myProducts() async {
    try {
      return await apiProvider.myProducts();
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

  Future<String?> uploadFile({required String localImg}) async {
    try {
      return await apiProvider.uploadFile(localImg: localImg);
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
}
