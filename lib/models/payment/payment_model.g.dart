// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      id: json['id'] as int,
      amount: json['amount'] as int,
      confirmedAmount: json['confirmedAmount'],
      status: json['status'] as String,
      senderName: json['senderName'] as String,
      orderNumber: json['orderNumber'] as String,
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      image: json['image'] as String,
      userId: json['userId'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'confirmedAmount': instance.confirmedAmount,
      'status': instance.status,
      'senderName': instance.senderName,
      'orderNumber': instance.orderNumber,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'image': instance.image,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
