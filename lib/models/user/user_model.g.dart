// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      profilePic: json['profilePic'] as String?,
      email: json['email'] as String,
      settings: json['settings'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      personalWalletBalance: json['personalWalletBalance'] as int,
      companyWalletBalance: json['companyWalletBalance'] as int,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'profilePic': instance.profilePic,
      'email': instance.email,
      'settings': instance.settings,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'personalWalletBalance': instance.personalWalletBalance,
      'companyWalletBalance': instance.companyWalletBalance,
    };
