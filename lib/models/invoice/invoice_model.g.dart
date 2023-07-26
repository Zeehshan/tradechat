// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceModel _$$_InvoiceModelFromJson(Map<String, dynamic> json) =>
    _$_InvoiceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      userId: json['userId'] as int,
      number: json['number'] as String,
      date: json['date'] as String,
      total: json['total'] as String,
      deliveryTerm: json['deliveryTerm'] as String,
      paymentTerm: json['paymentTerm'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      bundle:
          json['bundle'] == null ? null : BundleModel.fromJson(json['bundle']),
    );

Map<String, dynamic> _$$_InvoiceModelToJson(_$_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'number': instance.number,
      'date': instance.date,
      'total': instance.total,
      'deliveryTerm': instance.deliveryTerm,
      'paymentTerm': instance.paymentTerm,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bundle': instance.bundle,
    };

_$_BundleModel _$$_BundleModelFromJson(Map<String, dynamic> json) =>
    _$_BundleModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String?,
      userId: json['userId'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      orderProducts: (json['orderProducts'] as List<dynamic>)
          .map(OrderProductModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$$_BundleModelToJson(_$_BundleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orderProducts': instance.orderProducts,
    };

_$_OrderProductModel _$$_OrderProductModelFromJson(Map<String, dynamic> json) =>
    _$_OrderProductModel(
      id: json['id'] as int,
      orderId: json['orderId'] as int,
      quantity: json['quantity'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      productId: json['productId'] as int,
      product: json['Product'] == null
          ? null
          : ProductModel.fromJson(json['Product']),
    );

Map<String, dynamic> _$$_OrderProductModelToJson(
        _$_OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productId': instance.productId,
      'Product': instance.product,
    };

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      link: json['link'] as String,
      image: json['image'] as String?,
      price: json['price'] as int,
      title: json['title'] as String,
      userId: json['userId'] as int,
      category: json['category'] as String,
      quantity: json['quantity'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'image': instance.image,
      'price': instance.price,
      'title': instance.title,
      'userId': instance.userId,
      'category': instance.category,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
    };
