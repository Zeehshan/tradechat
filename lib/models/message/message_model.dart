import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    required int id,
    int? quoteToId,
    required int chatId,
    required int senderId,
    required String text,
    int? paymentRequestId,
    required String createdAt,
    required String updatedAt,
    String? fileUrl,
    @JsonKey(name: 'PaymentRequest') PaymentRequestModel? paymentRequest,
    bool? isDeleted,
    MessageModel? replyTo,
  }) = _MessageModel;

  factory MessageModel.fromJson(json) => _$MessageModelFromJson(json);
}

@freezed
class PaymentRequestModel with _$PaymentRequestModel {
  factory PaymentRequestModel({
    required int id,
    required int requesterId,
    required int requesteeId,
    required String amount,
    required String status,
    required String createdAt,
    required String updatedAt,
  }) = _PaymentRequestModel;

  factory PaymentRequestModel.fromJson(json) =>
      _$PaymentRequestModelFromJson(json);
}
