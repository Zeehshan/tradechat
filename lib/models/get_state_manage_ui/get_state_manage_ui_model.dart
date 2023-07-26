import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'get_state_manage_ui_model.freezed.dart';

@freezed
class GetStateManageUIModel with _$GetStateManageUIModel {
  const factory GetStateManageUIModel({
    required GetStateUIStatus uiStatus,
    required GetStateUIActionModel uiAction,
  }) = _GetStateManageUIModel;

  factory GetStateManageUIModel.initial() {
    return GetStateManageUIModel(
      uiStatus: GetStateUIStatus.loading,
      uiAction: GetStateUIActionModel.initial(),
    );
  }
}

@freezed
class GetStateUIActionModel with _$GetStateUIActionModel {
  const factory GetStateUIActionModel(
      {required GetStateUIActionType type,
      String? message,
      Map<String, dynamic>? errors,
      dynamic data}) = _GetStateUIActionModel;

  factory GetStateUIActionModel.initial() {
    return const GetStateUIActionModel(
        type: GetStateUIActionType.none,
        message: '',
        errors: <String, dynamic>{},
        data: null);
  }
}
