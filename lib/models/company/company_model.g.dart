// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyModel _$$_CompanyModelFromJson(Map<String, dynamic> json) =>
    _$_CompanyModel(
      id: json['id'] as int?,
      companyName: json['companyName'] as String?,
      managerFirstName: json['managerFirstName'] as String?,
      managerLastName: json['managerLastName'] as String?,
      companyPhone: json['companyPhone'] as String?,
      companyAddress: json['companyAddress'] as String?,
      companyCountry: json['companyCountry'] as String?,
      companyCity: json['companyCity'] as String?,
      companyZip: json['companyZip'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryCountry: json['deliveryCountry'] as String?,
      deliveryCity: json['deliveryCity'] as String?,
      deliveryZip: json['deliveryZip'],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_CompanyModelToJson(_$_CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'managerFirstName': instance.managerFirstName,
      'managerLastName': instance.managerLastName,
      'companyPhone': instance.companyPhone,
      'companyAddress': instance.companyAddress,
      'companyCountry': instance.companyCountry,
      'companyCity': instance.companyCity,
      'companyZip': instance.companyZip,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryCountry': instance.deliveryCountry,
      'deliveryCity': instance.deliveryCity,
      'deliveryZip': instance.deliveryZip,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
