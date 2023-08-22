import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_product_data_model.freezed.dart';
part 'my_product_data_model.g.dart';

@freezed
class MyProductDataModel with _$MyProductDataModel {
  factory MyProductDataModel({
    required int id,
    required String title,
    required String link,
    @StringToIntConverter() required int quantity,
    @StringToIntConverter() required int price,
    required String? image,
    required String? description,
    required int userId,
    required String? category,
    required String createdAt,
  }) = _MyProductDataModel;

  factory MyProductDataModel.fromJson(json) =>
      _$MyProductDataModelFromJson(json);
}

class StringToIntConverter implements JsonConverter<int, dynamic> {
  const StringToIntConverter();
  @override
  int fromJson(dynamic json) => json is int ? json : int.parse(json);

  @override
  dynamic toJson(int object) => object.toString();
}
