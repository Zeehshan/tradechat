// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProductModel _$$_MyProductModelFromJson(Map<String, dynamic> json) =>
    _$_MyProductModel(
      total: json['total'] as int,
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
      products: (json['products'] as List<dynamic>)
          .map(MyProductDataModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$$_MyProductModelToJson(_$_MyProductModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'products': instance.products,
    };
