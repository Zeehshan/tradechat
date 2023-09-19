import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel(
      {required int id,
      required int user1Id,
      required int user2Id,
      required String createdAt,
      required UserModel user1,
      required UserModel user2,
      required List<RecentMessageModel> message}) = _ChatModel;

  factory ChatModel.fromJson(json) => _$ChatModelFromJson(json);
}

@freezed
class RecentMessageModel with _$RecentMessageModel {
  factory RecentMessageModel({
    required String text,
    required String createdAt,
  }) = _RecentMessageModel;

  factory RecentMessageModel.fromJson(json) =>
      _$RecentMessageModelFromJson(json);
}
