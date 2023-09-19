import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'order_model.g.dart';
part 'order_model.freezed.dart';

@freezed
class OrderModel with _$OrderModel {
  factory OrderModel(
      {required int id,
      required int userId,
      required String name,
      required String image,
      required String createdAt,
      required String updatedAt,
      @Default([]) List<OrderProductModel> orderProducts,
      @Default({}) Map<String, dynamic> documents}) = _OrderModel;

  factory OrderModel.fromJson(json) => _$OrderModelFromJson(json);
}
