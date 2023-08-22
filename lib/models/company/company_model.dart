import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.g.dart';
part 'company_model.freezed.dart';

@freezed
class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    int? id,
    String? companyName,
    String? managerFirstName,
    String? managerLastName,
    String? companyPhone,
    String? companyAddress,
    String? companyCountry,
    String? companyCity,
    String? companyZip,
    String? deliveryAddress,
    String? deliveryCountry,
    String? deliveryCity,
    dynamic deliveryZip,
    String? createdAt,
    String? updatedAt,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(json) => _$CompanyModelFromJson(json);
}
