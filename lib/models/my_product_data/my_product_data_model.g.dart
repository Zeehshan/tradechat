// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyProductDataModel _$$_MyProductDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_MyProductDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
      link: json['link'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      image: json['image'] as String?,
      description: json['description'] as String?,
      userId: json['userId'] as int,
      category: json['category'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_MyProductDataModelToJson(
        _$_MyProductDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'quantity': instance.quantity,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'userId': instance.userId,
      'category': instance.category,
      'createdAt': instance.createdAt,
    };
