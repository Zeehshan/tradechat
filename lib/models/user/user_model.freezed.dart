// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  SettingModel? get settings => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get personalWalletBalance => throw _privateConstructorUsedError;
  int? get companyWalletBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
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
      int? companyWalletBalance});

  $SettingModelCopyWith<$Res>? get settings;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? profilePic = freezed,
    Object? email = freezed,
    Object? settings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? personalWalletBalance = freezed,
    Object? companyWalletBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      personalWalletBalance: freezed == personalWalletBalance
          ? _value.personalWalletBalance
          : personalWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      companyWalletBalance: freezed == companyWalletBalance
          ? _value.companyWalletBalance
          : companyWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $SettingModelCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
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
      int? companyWalletBalance});

  @override
  $SettingModelCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? username = freezed,
    Object? phoneNumber = freezed,
    Object? profilePic = freezed,
    Object? email = freezed,
    Object? settings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? personalWalletBalance = freezed,
    Object? companyWalletBalance = freezed,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      personalWalletBalance: freezed == personalWalletBalance
          ? _value.personalWalletBalance
          : personalWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      companyWalletBalance: freezed == companyWalletBalance
          ? _value.companyWalletBalance
          : companyWalletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.id,
      this.firstName,
      this.lastName,
      this.role,
      this.username,
      this.phoneNumber,
      this.profilePic,
      this.email,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.personalWalletBalance,
      this.companyWalletBalance});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final int id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? role;
  @override
  final String? username;
  @override
  final String? phoneNumber;
  @override
  final String? profilePic;
  @override
  final String? email;
  @override
  final SettingModel? settings;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? personalWalletBalance;
  @override
  final int? companyWalletBalance;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, role: $role, username: $username, phoneNumber: $phoneNumber, profilePic: $profilePic, email: $email, settings: $settings, createdAt: $createdAt, updatedAt: $updatedAt, personalWalletBalance: $personalWalletBalance, companyWalletBalance: $companyWalletBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.personalWalletBalance, personalWalletBalance) ||
                other.personalWalletBalance == personalWalletBalance) &&
            (identical(other.companyWalletBalance, companyWalletBalance) ||
                other.companyWalletBalance == companyWalletBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      role,
      username,
      phoneNumber,
      profilePic,
      email,
      settings,
      createdAt,
      updatedAt,
      personalWalletBalance,
      companyWalletBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final int id,
      final String? firstName,
      final String? lastName,
      final String? role,
      final String? username,
      final String? phoneNumber,
      final String? profilePic,
      final String? email,
      final SettingModel? settings,
      final String? createdAt,
      final String? updatedAt,
      final int? personalWalletBalance,
      final int? companyWalletBalance}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get role;
  @override
  String? get username;
  @override
  String? get phoneNumber;
  @override
  String? get profilePic;
  @override
  String? get email;
  @override
  SettingModel? get settings;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get personalWalletBalance;
  @override
  int? get companyWalletBalance;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$_SettingModelCopyWith(
          _$_SettingModel value, $Res Function(_$_SettingModel) then) =
      __$$_SettingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_SettingModelCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$_SettingModel>
    implements _$$_SettingModelCopyWith<$Res> {
  __$$_SettingModelCopyWithImpl(
      _$_SettingModel _value, $Res Function(_$_SettingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_SettingModel(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingModel implements _SettingModel {
  _$_SettingModel({required this.password});

  factory _$_SettingModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingModelFromJson(json);

  @override
  final String password;

  @override
  String toString() {
    return 'SettingModel(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingModel &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      __$$_SettingModelCopyWithImpl<_$_SettingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingModelToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  factory _SettingModel({required final String password}) = _$_SettingModel;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$_SettingModel.fromJson;

  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
