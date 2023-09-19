// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      id: json['id'] as int,
      quoteToId: json['quoteToId'] as int?,
      chatId: json['chatId'] as int,
      senderId: json['senderId'] as int,
      text: json['text'] as String,
      paymentRequestId: json['paymentRequestId'] as int?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      fileUrl: json['fileUrl'] as String?,
      paymentRequest: json['PaymentRequest'] == null
          ? null
          : PaymentRequestModel.fromJson(json['PaymentRequest']),
      isDeleted: json['isDeleted'] as bool?,
      replyTo: json['replyTo'] == null
          ? null
          : MessageModel.fromJson(json['replyTo']),
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quoteToId': instance.quoteToId,
      'chatId': instance.chatId,
      'senderId': instance.senderId,
      'text': instance.text,
      'paymentRequestId': instance.paymentRequestId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fileUrl': instance.fileUrl,
      'PaymentRequest': instance.paymentRequest,
      'isDeleted': instance.isDeleted,
      'replyTo': instance.replyTo,
    };

_$_PaymentRequestModel _$$_PaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentRequestModel(
      id: json['id'] as int,
      requesterId: json['requesterId'] as int,
      requesteeId: json['requesteeId'] as int,
      amount: json['amount'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_PaymentRequestModelToJson(
        _$_PaymentRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requesterId': instance.requesterId,
      'requesteeId': instance.requesteeId,
      'amount': instance.amount,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
