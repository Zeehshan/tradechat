import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_model.g.dart';
part 'payment_model.freezed.dart';

@freezed
class PaymentModel with _$PaymentModel {
  factory PaymentModel({
    required int id,
    required int amount,
    required dynamic confirmedAmount,
    required String status,
    required String senderName,
    required String orderNumber,
    required String accountNumber,
    required String accountType,
    required String image,
    required int userId,
    required String createdAt,
    required String updatedAt,
  }) = _PaymentModel;
  factory PaymentModel.fromJson(json) => _$PaymentModelFromJson(json);
}
