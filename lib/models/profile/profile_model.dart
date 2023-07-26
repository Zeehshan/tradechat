import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'profile_model.g.dart';
part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required UserModel? user,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(json) => _$ProfileModelFromJson(json);
}
