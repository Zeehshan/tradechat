// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as int,
      user1Id: json['user1Id'] as int,
      user2Id: json['user2Id'] as int,
      createdAt: json['createdAt'] as String,
      user1: UserModel.fromJson(json['user1']),
      user2: UserModel.fromJson(json['user2']),
      message: (json['message'] as List<dynamic>)
          .map(RecentMessageModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'createdAt': instance.createdAt,
      'user1': instance.user1,
      'user2': instance.user2,
      'message': instance.message,
    };

_$_RecentMessageModel _$$_RecentMessageModelFromJson(
        Map<String, dynamic> json) =>
    _$_RecentMessageModel(
      text: json['text'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$_RecentMessageModelToJson(
        _$_RecentMessageModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'createdAt': instance.createdAt,
    };
