import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'my_product_model.g.dart';
part 'my_product_model.freezed.dart';

@freezed
class MyProductModel with _$MyProductModel {
  factory MyProductModel({
    required int total,
    required int totalPages,
    required int currentPage,
    required List<MyProductDataModel> products,
  }) = _MyProductModel;

  factory MyProductModel.fromJson(json) => _$MyProductModelFromJson(json);
}
