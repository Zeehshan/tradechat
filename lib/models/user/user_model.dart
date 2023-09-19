import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required int id,
      String? firstName,
      String? lastName,
      String? role,
      String? username,
      String? phoneNumber,
      String? profilePic,
      String? email,
      SettingModel? settings,
      String? createdAt,
      String? updatedAt,
      int? personalWalletBalance,
      int? companyWalletBalance}) = _UserModel;
  factory UserModel.fromJson(json) => _$UserModelFromJson(json);
}

@freezed
class SettingModel with _$SettingModel {
  factory SettingModel({required String password}) = _SettingModel;

  factory SettingModel.fromJson(json) => _$SettingModelFromJson(json);
}
