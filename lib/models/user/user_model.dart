import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required int id,
      required String? firstName,
      required String? lastName,
      required String? username,
      required String? phoneNumber,
      required String email,
      required String? settings,
      required String createdAt,
      required String updatedAt,
      required int personalWalletBalance,
      required int companyWalletBalance}) = _UserModel;
  factory UserModel.fromJson(json) => _$UserModelFromJson(json);
}
