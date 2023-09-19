import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../configs/apis/apis.dart';
import '../../../models/models.dart';
import '../providers.dart';

class AppApiHttpProvider extends BaseApiProvider implements AppApiProvider {
  @override
  Future<MyProductDataModel> addProduct(
      {required String title,
      required String link,
      required String qty,
      required String price,
      required String description,
      required List<String> imgs}) async {
    try {
      String path = BackendApis.addProduct;
      final data = {
        'title': title,
        'link': link,
        'quantity': qty,
        'price': price,
        'description': description,
        'category': 'a',
        'image': imgs.join(',')
      };
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      return MyProductDataModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyProductModel?> myProducts({int currentPage = 1}) async {
    try {
      String path = '${BackendApis.myProducts}?page=$currentPage';
      final response = await backendApiReq.get(path);
      final myProducts = MyProductModel.fromJson(response.data);
      return myProducts;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    try {
      String path = BackendApis.deleteProduct
          .toString()
          .replaceAll('{productId}', id.toString());
      await backendApiReq.delete(path);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future editProduct(
      {required int id,
      String? title,
      String? link,
      String? qty,
      String? price,
      String? description,
      List<String>? imgs}) async {
    try {
      String path = BackendApis.updateProduct
          .toString()
          .replaceAll('{productId}', id.toString());

      final data = {
        'title': title,
        'link': link,
        'quantity': qty,
        'price': price,
        'description': description,
        'image': imgs!.join(',')
      };
      data.removeWhere((key, value) => value == null);
      final response = await backendApiReq.put(path, data: jsonEncode(data));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderModel?> createOrder(
      {String? orderId, required String name, required String img}) async {
    try {
      String path =
          orderId == null ? BackendApis.order : '${BackendApis.order}/$orderId';
      final data = {
        'name': name,
        'image': img,
      };
      final response = orderId != null
          ? await backendApiReq.put(path, data: jsonEncode(data))
          : await backendApiReq.post(path, data: jsonEncode(data));
      if (orderId != null) {
        final orderDetails = await getOrderDetials(orderId: orderId);
        return orderDetails;
      } else {
        final order = OrderModel.fromJson(response.data);
        return order;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> uploadFile(
      {required String localImg,
      Function(String file, double progress)? onReceiveProgress}) async {
    try {
      String path = BackendApis.file;

      final data = FormData.fromMap(
        {'file': await MultipartFile.fromFile(localImg)},
      );
      final response = await backendApiReq.post(path,
          data: data,
          onReceiveProgress: onReceiveProgress == null
              ? null
              : (sentBytes, totalBytes) {
                  double __progressValue = Util.remap(
                      sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);
                  __progressValue =
                      double.parse(__progressValue.toStringAsFixed(2));
                  onReceiveProgress(
                    localImg,
                    __progressValue,
                  );
                });
      return response.data['fileUrl'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderModel>> myOrders() async {
    try {
      String path = BackendApis.order;
      final response = await backendApiReq.get(path);
      final orders = (response.data as List<dynamic>)
          .map((json) => OrderModel.fromJson(json))
          .toList();
      return orders;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteOrder({required int orderId}) async {
    try {
      String path = '${BackendApis.order}/$orderId';
      await backendApiReq.delete(path);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<InvoiceModel> createInvoice({required int orderId}) async {
    try {
      String path = BackendApis.invoice;
      final data = {'orderId': orderId};
      final response = await backendApiReq.post(path, data: jsonEncode(data));
      response.data['total'] = response.data['total'].toString();
      return InvoiceModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteInvoice({required int invoiceId}) async {
    try {
      String path = '${BackendApis.invoice}/$invoiceId';
      await backendApiReq.delete(path);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<InvoiceModel>> invoices() async {
    try {
      String path = BackendApis.invoice;
      final response = await backendApiReq.get(path);
      List<InvoiceModel> invoices = (response.data as List<dynamic>)
          .map((e) => InvoiceModel.fromJson(e))
          .toList();
      return invoices;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteFile({required String name}) async {
    try {
      String path = BackendApis.fileDelete;

      final data = {'url': name};
      await backendApiReq.delete(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future orderProductsUpdate(
      {required int id, required List<Map<String, int>> products}) async {
    try {
      String path = '${BackendApis.order}/$id';
      final data = {
        'products': products,
      };
      await backendApiReq.put(path, data: jsonEncode(data));
      final orderDetails = getOrderDetials(orderId: id.toString());
      return orderDetails;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderModel?> getOrderDetials({String? orderId}) async {
    try {
      String path = '${BackendApis.order}/$orderId';
      final response = await backendApiReq.get(path);
      final order = OrderModel.fromJson(response.data);
      return order;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateInvoice(
      {required int id, required Map<String, dynamic> invoice}) async {
    try {
      String path = '${BackendApis.invoice}/$id';
      final response = await backendApiReq.put(path, data: jsonEncode(invoice));
      // final order = InvoiceModel.fromJson(response.data);
      // return order;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> createChat({required int id}) async {
    try {
      String path = BackendApis.chatRequest;
      final response =
          await backendApiReq.post(path, data: jsonEncode({'requesteeId': id}));
      return response.data['chatId'] as int;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future orderDocumentsUpdate(
      {required int id, required Map<String, dynamic> documents}) async {
    try {
      String path = '${BackendApis.order}/$id';
      final data = {
        'documents': documents,
      };
      await backendApiReq.put(path, data: jsonEncode(data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future addNewPayment(
      {required int amount,
      required String senderName,
      required int orderNumber,
      required int accountNumber,
      required String accountType,
      required String image}) async {
    try {
      String path = BackendApis.newPayment;
      final data = {
        'amount': amount,
        'senderName': senderName,
        'orderNumber': orderNumber,
        'accountNumber': accountNumber,
        'accountType': accountType,
        'image': image
      };
      await backendApiReq.post(path, data: jsonEncode(data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deletePayment({required int id}) async {
    try {
      String path = '${BackendApis.newPayment}/$id';
      await backendApiReq.delete(path);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updatePayment(
      {required int id,
      required int amount,
      required String senderName,
      required int orderNumber,
      required int accountNumber,
      required String accountType}) async {
    try {
      String path = '${BackendApis.newPayment}/$id';
      final data = {
        'amount': amount,
        'senderName': senderName,
        'orderNumber': orderNumber,
        'accountNumber': accountNumber,
        'accountType': accountType,
      };
      await backendApiReq.put(path, data: jsonEncode(data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaymentModel> confirmAmount(
      {required int amount, required int id}) async {
    try {
      String path =
          BackendApis.confirmPayment.replaceAll('{paymentId}', id.toString());
      final data = {
        'amount': amount,
      };
      final res = await backendApiReq.post(path, data: jsonEncode(data));
      return PaymentModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteChat({required int id}) async {
    try {
      String path =
          BackendApis.deleteChat.replaceAll('{chatId}', id.toString());
      await backendApiReq.post(path);
    } catch (e) {
      rethrow;
    }
  }
}

class Util {
  static double remap(
      double value,
      double originalMinValue,
      double originalMaxValue,
      double translatedMinValue,
      double translatedMaxValue) {
    if (originalMaxValue - originalMinValue == 0) return 0;

    return (value - originalMinValue) /
            (originalMaxValue - originalMinValue) *
            (translatedMaxValue - translatedMinValue) +
        translatedMinValue;
  }
}
