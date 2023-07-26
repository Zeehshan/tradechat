// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_state_manage_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetStateManageUIModel {
  GetStateUIStatus get uiStatus => throw _privateConstructorUsedError;
  GetStateUIActionModel get uiAction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetStateManageUIModelCopyWith<GetStateManageUIModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStateManageUIModelCopyWith<$Res> {
  factory $GetStateManageUIModelCopyWith(GetStateManageUIModel value,
          $Res Function(GetStateManageUIModel) then) =
      _$GetStateManageUIModelCopyWithImpl<$Res, GetStateManageUIModel>;
  @useResult
  $Res call({GetStateUIStatus uiStatus, GetStateUIActionModel uiAction});

  $GetStateUIActionModelCopyWith<$Res> get uiAction;
}

/// @nodoc
class _$GetStateManageUIModelCopyWithImpl<$Res,
        $Val extends GetStateManageUIModel>
    implements $GetStateManageUIModelCopyWith<$Res> {
  _$GetStateManageUIModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiStatus = null,
    Object? uiAction = null,
  }) {
    return _then(_value.copyWith(
      uiStatus: null == uiStatus
          ? _value.uiStatus
          : uiStatus // ignore: cast_nullable_to_non_nullable
              as GetStateUIStatus,
      uiAction: null == uiAction
          ? _value.uiAction
          : uiAction // ignore: cast_nullable_to_non_nullable
              as GetStateUIActionModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetStateUIActionModelCopyWith<$Res> get uiAction {
    return $GetStateUIActionModelCopyWith<$Res>(_value.uiAction, (value) {
      return _then(_value.copyWith(uiAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetStateManageUIModelCopyWith<$Res>
    implements $GetStateManageUIModelCopyWith<$Res> {
  factory _$$_GetStateManageUIModelCopyWith(_$_GetStateManageUIModel value,
          $Res Function(_$_GetStateManageUIModel) then) =
      __$$_GetStateManageUIModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetStateUIStatus uiStatus, GetStateUIActionModel uiAction});

  @override
  $GetStateUIActionModelCopyWith<$Res> get uiAction;
}

/// @nodoc
class __$$_GetStateManageUIModelCopyWithImpl<$Res>
    extends _$GetStateManageUIModelCopyWithImpl<$Res, _$_GetStateManageUIModel>
    implements _$$_GetStateManageUIModelCopyWith<$Res> {
  __$$_GetStateManageUIModelCopyWithImpl(_$_GetStateManageUIModel _value,
      $Res Function(_$_GetStateManageUIModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiStatus = null,
    Object? uiAction = null,
  }) {
    return _then(_$_GetStateManageUIModel(
      uiStatus: null == uiStatus
          ? _value.uiStatus
          : uiStatus // ignore: cast_nullable_to_non_nullable
              as GetStateUIStatus,
      uiAction: null == uiAction
          ? _value.uiAction
          : uiAction // ignore: cast_nullable_to_non_nullable
              as GetStateUIActionModel,
    ));
  }
}

/// @nodoc

class _$_GetStateManageUIModel implements _GetStateManageUIModel {
  const _$_GetStateManageUIModel(
      {required this.uiStatus, required this.uiAction});

  @override
  final GetStateUIStatus uiStatus;
  @override
  final GetStateUIActionModel uiAction;

  @override
  String toString() {
    return 'GetStateManageUIModel(uiStatus: $uiStatus, uiAction: $uiAction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetStateManageUIModel &&
            (identical(other.uiStatus, uiStatus) ||
                other.uiStatus == uiStatus) &&
            (identical(other.uiAction, uiAction) ||
                other.uiAction == uiAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uiStatus, uiAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetStateManageUIModelCopyWith<_$_GetStateManageUIModel> get copyWith =>
      __$$_GetStateManageUIModelCopyWithImpl<_$_GetStateManageUIModel>(
          this, _$identity);
}

abstract class _GetStateManageUIModel implements GetStateManageUIModel {
  const factory _GetStateManageUIModel(
          {required final GetStateUIStatus uiStatus,
          required final GetStateUIActionModel uiAction}) =
      _$_GetStateManageUIModel;

  @override
  GetStateUIStatus get uiStatus;
  @override
  GetStateUIActionModel get uiAction;
  @override
  @JsonKey(ignore: true)
  _$$_GetStateManageUIModelCopyWith<_$_GetStateManageUIModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetStateUIActionModel {
  GetStateUIActionType get type => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get errors => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetStateUIActionModelCopyWith<GetStateUIActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStateUIActionModelCopyWith<$Res> {
  factory $GetStateUIActionModelCopyWith(GetStateUIActionModel value,
          $Res Function(GetStateUIActionModel) then) =
      _$GetStateUIActionModelCopyWithImpl<$Res, GetStateUIActionModel>;
  @useResult
  $Res call(
      {GetStateUIActionType type,
      String? message,
      Map<String, dynamic>? errors,
      dynamic data});
}

/// @nodoc
class _$GetStateUIActionModelCopyWithImpl<$Res,
        $Val extends GetStateUIActionModel>
    implements $GetStateUIActionModelCopyWith<$Res> {
  _$GetStateUIActionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GetStateUIActionType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetStateUIActionModelCopyWith<$Res>
    implements $GetStateUIActionModelCopyWith<$Res> {
  factory _$$_GetStateUIActionModelCopyWith(_$_GetStateUIActionModel value,
          $Res Function(_$_GetStateUIActionModel) then) =
      __$$_GetStateUIActionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetStateUIActionType type,
      String? message,
      Map<String, dynamic>? errors,
      dynamic data});
}

/// @nodoc
class __$$_GetStateUIActionModelCopyWithImpl<$Res>
    extends _$GetStateUIActionModelCopyWithImpl<$Res, _$_GetStateUIActionModel>
    implements _$$_GetStateUIActionModelCopyWith<$Res> {
  __$$_GetStateUIActionModelCopyWithImpl(_$_GetStateUIActionModel _value,
      $Res Function(_$_GetStateUIActionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
    Object? errors = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_GetStateUIActionModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GetStateUIActionType,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_GetStateUIActionModel implements _GetStateUIActionModel {
  const _$_GetStateUIActionModel(
      {required this.type,
      this.message,
      final Map<String, dynamic>? errors,
      this.data})
      : _errors = errors;

  @override
  final GetStateUIActionType type;
  @override
  final String? message;
  final Map<String, dynamic>? _errors;
  @override
  Map<String, dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final dynamic data;

  @override
  String toString() {
    return 'GetStateUIActionModel(type: $type, message: $message, errors: $errors, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetStateUIActionModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      message,
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetStateUIActionModelCopyWith<_$_GetStateUIActionModel> get copyWith =>
      __$$_GetStateUIActionModelCopyWithImpl<_$_GetStateUIActionModel>(
          this, _$identity);
}

abstract class _GetStateUIActionModel implements GetStateUIActionModel {
  const factory _GetStateUIActionModel(
      {required final GetStateUIActionType type,
      final String? message,
      final Map<String, dynamic>? errors,
      final dynamic data}) = _$_GetStateUIActionModel;

  @override
  GetStateUIActionType get type;
  @override
  String? get message;
  @override
  Map<String, dynamic>? get errors;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetStateUIActionModelCopyWith<_$_GetStateUIActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
