import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.g.dart';
part 'invoice_model.freezed.dart';

@freezed
class InvoiceModel with _$InvoiceModel {
  factory InvoiceModel({
    required int id,
    required String name,
    required int userId,
    required String number,
    required String date,
    required String total,
    required String deliveryTerm,
    required String paymentTerm,
    required String createdAt,
    required String updatedAt,
    BundleModel? bundle,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(json) => _$InvoiceModelFromJson(json);
}

@freezed
class BundleModel with _$BundleModel {
  factory BundleModel({
    required int id,
    required String name,
    required String? image,
    required int userId,
    required String createdAt,
    required String updatedAt,
    required List<OrderProductModel> orderProducts,
  }) = _BundleModel;
  factory BundleModel.fromJson(json) => _$BundleModelFromJson(json);
}

@freezed
class OrderProductModel with _$OrderProductModel {
  factory OrderProductModel({
    required int id,
    required int orderId,
    required int quantity,
    required String createdAt,
    required String updatedAt,
    required int productId,
    @JsonKey(name: 'Product') required ProductModel? product,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(json) => _$OrderProductModelFromJson(json);
}

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String link,
    required String? image,
    required int price,
    required String title,
    required int userId,
    required String category,
    required int quantity,
    required String createdAt,
    required String updatedAt,
    required String? description,
  }) = _ProductModel;

  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);
}
