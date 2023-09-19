// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  int get id => throw _privateConstructorUsedError;
  int get user1Id => throw _privateConstructorUsedError;
  int get user2Id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  UserModel get user1 => throw _privateConstructorUsedError;
  UserModel get user2 => throw _privateConstructorUsedError;
  List<RecentMessageModel> get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {int id,
      int user1Id,
      int user2Id,
      String createdAt,
      UserModel user1,
      UserModel user2,
      List<RecentMessageModel> message});

  $UserModelCopyWith<$Res> get user1;
  $UserModelCopyWith<$Res> get user2;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? createdAt = null,
    Object? user1 = null,
    Object? user2 = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user1: null == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserModel,
      user2: null == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserModel,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as List<RecentMessageModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user1 {
    return $UserModelCopyWith<$Res>(_value.user1, (value) {
      return _then(_value.copyWith(user1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user2 {
    return $UserModelCopyWith<$Res>(_value.user2, (value) {
      return _then(_value.copyWith(user2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$_ChatModelCopyWith(
          _$_ChatModel value, $Res Function(_$_ChatModel) then) =
      __$$_ChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user1Id,
      int user2Id,
      String createdAt,
      UserModel user1,
      UserModel user2,
      List<RecentMessageModel> message});

  @override
  $UserModelCopyWith<$Res> get user1;
  @override
  $UserModelCopyWith<$Res> get user2;
}

/// @nodoc
class __$$_ChatModelCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$_ChatModel>
    implements _$$_ChatModelCopyWith<$Res> {
  __$$_ChatModelCopyWithImpl(
      _$_ChatModel _value, $Res Function(_$_ChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user1Id = null,
    Object? user2Id = null,
    Object? createdAt = null,
    Object? user1 = null,
    Object? user2 = null,
    Object? message = null,
  }) {
    return _then(_$_ChatModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user1Id: null == user1Id
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int,
      user2Id: null == user2Id
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user1: null == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserModel,
      user2: null == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserModel,
      message: null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as List<RecentMessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatModel implements _ChatModel {
  _$_ChatModel(
      {required this.id,
      required this.user1Id,
      required this.user2Id,
      required this.createdAt,
      required this.user1,
      required this.user2,
      required final List<RecentMessageModel> message})
      : _message = message;

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  final int id;
  @override
  final int user1Id;
  @override
  final int user2Id;
  @override
  final String createdAt;
  @override
  final UserModel user1;
  @override
  final UserModel user2;
  final List<RecentMessageModel> _message;
  @override
  List<RecentMessageModel> get message {
    if (_message is EqualUnmodifiableListView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_message);
  }

  @override
  String toString() {
    return 'ChatModel(id: $id, user1Id: $user1Id, user2Id: $user2Id, createdAt: $createdAt, user1: $user1, user2: $user2, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user1Id, user1Id) || other.user1Id == user1Id) &&
            (identical(other.user2Id, user2Id) || other.user2Id == user2Id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user1, user1) || other.user1 == user1) &&
            (identical(other.user2, user2) || other.user2 == user2) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user1Id, user2Id, createdAt,
      user1, user2, const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      __$$_ChatModelCopyWithImpl<_$_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  factory _ChatModel(
      {required final int id,
      required final int user1Id,
      required final int user2Id,
      required final String createdAt,
      required final UserModel user1,
      required final UserModel user2,
      required final List<RecentMessageModel> message}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  int get id;
  @override
  int get user1Id;
  @override
  int get user2Id;
  @override
  String get createdAt;
  @override
  UserModel get user1;
  @override
  UserModel get user2;
  @override
  List<RecentMessageModel> get message;
  @override
  @JsonKey(ignore: true)
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentMessageModel _$RecentMessageModelFromJson(Map<String, dynamic> json) {
  return _RecentMessageModel.fromJson(json);
}

/// @nodoc
mixin _$RecentMessageModel {
  String get text => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentMessageModelCopyWith<RecentMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentMessageModelCopyWith<$Res> {
  factory $RecentMessageModelCopyWith(
          RecentMessageModel value, $Res Function(RecentMessageModel) then) =
      _$RecentMessageModelCopyWithImpl<$Res, RecentMessageModel>;
  @useResult
  $Res call({String text, String createdAt});
}

/// @nodoc
class _$RecentMessageModelCopyWithImpl<$Res, $Val extends RecentMessageModel>
    implements $RecentMessageModelCopyWith<$Res> {
  _$RecentMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecentMessageModelCopyWith<$Res>
    implements $RecentMessageModelCopyWith<$Res> {
  factory _$$_RecentMessageModelCopyWith(_$_RecentMessageModel value,
          $Res Function(_$_RecentMessageModel) then) =
      __$$_RecentMessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String createdAt});
}

/// @nodoc
class __$$_RecentMessageModelCopyWithImpl<$Res>
    extends _$RecentMessageModelCopyWithImpl<$Res, _$_RecentMessageModel>
    implements _$$_RecentMessageModelCopyWith<$Res> {
  __$$_RecentMessageModelCopyWithImpl(
      _$_RecentMessageModel _value, $Res Function(_$_RecentMessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_$_RecentMessageModel(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecentMessageModel implements _RecentMessageModel {
  _$_RecentMessageModel({required this.text, required this.createdAt});

  factory _$_RecentMessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecentMessageModelFromJson(json);

  @override
  final String text;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'RecentMessageModel(text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentMessageModel &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecentMessageModelCopyWith<_$_RecentMessageModel> get copyWith =>
      __$$_RecentMessageModelCopyWithImpl<_$_RecentMessageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecentMessageModelToJson(
      this,
    );
  }
}

abstract class _RecentMessageModel implements RecentMessageModel {
  factory _RecentMessageModel(
      {required final String text,
      required final String createdAt}) = _$_RecentMessageModel;

  factory _RecentMessageModel.fromJson(Map<String, dynamic> json) =
      _$_RecentMessageModel.fromJson;

  @override
  String get text;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_RecentMessageModelCopyWith<_$_RecentMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
