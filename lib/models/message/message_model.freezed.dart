// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  int get id => throw _privateConstructorUsedError;
  int? get quoteToId => throw _privateConstructorUsedError;
  int get chatId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int? get paymentRequestId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentRequest')
  PaymentRequestModel? get paymentRequest => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  MessageModel? get replyTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {int id,
      int? quoteToId,
      int chatId,
      int senderId,
      String text,
      int? paymentRequestId,
      String createdAt,
      String updatedAt,
      String? fileUrl,
      @JsonKey(name: 'PaymentRequest') PaymentRequestModel? paymentRequest,
      bool? isDeleted,
      MessageModel? replyTo});

  $PaymentRequestModelCopyWith<$Res>? get paymentRequest;
  $MessageModelCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quoteToId = freezed,
    Object? chatId = null,
    Object? senderId = null,
    Object? text = null,
    Object? paymentRequestId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? fileUrl = freezed,
    Object? paymentRequest = freezed,
    Object? isDeleted = freezed,
    Object? replyTo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quoteToId: freezed == quoteToId
          ? _value.quoteToId
          : quoteToId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRequestId: freezed == paymentRequestId
          ? _value.paymentRequestId
          : paymentRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequest: freezed == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentRequestModelCopyWith<$Res>? get paymentRequest {
    if (_value.paymentRequest == null) {
      return null;
    }

    return $PaymentRequestModelCopyWith<$Res>(_value.paymentRequest!, (value) {
      return _then(_value.copyWith(paymentRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res>? get replyTo {
    if (_value.replyTo == null) {
      return null;
    }

    return $MessageModelCopyWith<$Res>(_value.replyTo!, (value) {
      return _then(_value.copyWith(replyTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$_MessageModelCopyWith(
          _$_MessageModel value, $Res Function(_$_MessageModel) then) =
      __$$_MessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? quoteToId,
      int chatId,
      int senderId,
      String text,
      int? paymentRequestId,
      String createdAt,
      String updatedAt,
      String? fileUrl,
      @JsonKey(name: 'PaymentRequest') PaymentRequestModel? paymentRequest,
      bool? isDeleted,
      MessageModel? replyTo});

  @override
  $PaymentRequestModelCopyWith<$Res>? get paymentRequest;
  @override
  $MessageModelCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$$_MessageModelCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$_MessageModel>
    implements _$$_MessageModelCopyWith<$Res> {
  __$$_MessageModelCopyWithImpl(
      _$_MessageModel _value, $Res Function(_$_MessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quoteToId = freezed,
    Object? chatId = null,
    Object? senderId = null,
    Object? text = null,
    Object? paymentRequestId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? fileUrl = freezed,
    Object? paymentRequest = freezed,
    Object? isDeleted = freezed,
    Object? replyTo = freezed,
  }) {
    return _then(_$_MessageModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quoteToId: freezed == quoteToId
          ? _value.quoteToId
          : quoteToId // ignore: cast_nullable_to_non_nullable
              as int?,
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRequestId: freezed == paymentRequestId
          ? _value.paymentRequestId
          : paymentRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequest: freezed == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as MessageModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageModel implements _MessageModel {
  _$_MessageModel(
      {required this.id,
      this.quoteToId,
      required this.chatId,
      required this.senderId,
      required this.text,
      this.paymentRequestId,
      required this.createdAt,
      required this.updatedAt,
      this.fileUrl,
      @JsonKey(name: 'PaymentRequest') this.paymentRequest,
      this.isDeleted,
      this.replyTo});

  factory _$_MessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_MessageModelFromJson(json);

  @override
  final int id;
  @override
  final int? quoteToId;
  @override
  final int chatId;
  @override
  final int senderId;
  @override
  final String text;
  @override
  final int? paymentRequestId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? fileUrl;
  @override
  @JsonKey(name: 'PaymentRequest')
  final PaymentRequestModel? paymentRequest;
  @override
  final bool? isDeleted;
  @override
  final MessageModel? replyTo;

  @override
  String toString() {
    return 'MessageModel(id: $id, quoteToId: $quoteToId, chatId: $chatId, senderId: $senderId, text: $text, paymentRequestId: $paymentRequestId, createdAt: $createdAt, updatedAt: $updatedAt, fileUrl: $fileUrl, paymentRequest: $paymentRequest, isDeleted: $isDeleted, replyTo: $replyTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quoteToId, quoteToId) ||
                other.quoteToId == quoteToId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.paymentRequestId, paymentRequestId) ||
                other.paymentRequestId == paymentRequestId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.paymentRequest, paymentRequest) ||
                other.paymentRequest == paymentRequest) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quoteToId,
      chatId,
      senderId,
      text,
      paymentRequestId,
      createdAt,
      updatedAt,
      fileUrl,
      paymentRequest,
      isDeleted,
      replyTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      __$$_MessageModelCopyWithImpl<_$_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageModelToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  factory _MessageModel(
      {required final int id,
      final int? quoteToId,
      required final int chatId,
      required final int senderId,
      required final String text,
      final int? paymentRequestId,
      required final String createdAt,
      required final String updatedAt,
      final String? fileUrl,
      @JsonKey(name: 'PaymentRequest')
      final PaymentRequestModel? paymentRequest,
      final bool? isDeleted,
      final MessageModel? replyTo}) = _$_MessageModel;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$_MessageModel.fromJson;

  @override
  int get id;
  @override
  int? get quoteToId;
  @override
  int get chatId;
  @override
  int get senderId;
  @override
  String get text;
  @override
  int? get paymentRequestId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get fileUrl;
  @override
  @JsonKey(name: 'PaymentRequest')
  PaymentRequestModel? get paymentRequest;
  @override
  bool? get isDeleted;
  @override
  MessageModel? get replyTo;
  @override
  @JsonKey(ignore: true)
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) {
  return _PaymentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequestModel {
  int get id => throw _privateConstructorUsedError;
  int get requesterId => throw _privateConstructorUsedError;
  int get requesteeId => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestModelCopyWith<PaymentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestModelCopyWith<$Res> {
  factory $PaymentRequestModelCopyWith(
          PaymentRequestModel value, $Res Function(PaymentRequestModel) then) =
      _$PaymentRequestModelCopyWithImpl<$Res, PaymentRequestModel>;
  @useResult
  $Res call(
      {int id,
      int requesterId,
      int requesteeId,
      String amount,
      String status,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$PaymentRequestModelCopyWithImpl<$Res, $Val extends PaymentRequestModel>
    implements $PaymentRequestModelCopyWith<$Res> {
  _$PaymentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? requesteeId = null,
    Object? amount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      requesterId: null == requesterId
          ? _value.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as int,
      requesteeId: null == requesteeId
          ? _value.requesteeId
          : requesteeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentRequestModelCopyWith<$Res>
    implements $PaymentRequestModelCopyWith<$Res> {
  factory _$$_PaymentRequestModelCopyWith(_$_PaymentRequestModel value,
          $Res Function(_$_PaymentRequestModel) then) =
      __$$_PaymentRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int requesterId,
      int requesteeId,
      String amount,
      String status,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$_PaymentRequestModelCopyWithImpl<$Res>
    extends _$PaymentRequestModelCopyWithImpl<$Res, _$_PaymentRequestModel>
    implements _$$_PaymentRequestModelCopyWith<$Res> {
  __$$_PaymentRequestModelCopyWithImpl(_$_PaymentRequestModel _value,
      $Res Function(_$_PaymentRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? requesteeId = null,
    Object? amount = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_PaymentRequestModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      requesterId: null == requesterId
          ? _value.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as int,
      requesteeId: null == requesteeId
          ? _value.requesteeId
          : requesteeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentRequestModel implements _PaymentRequestModel {
  _$_PaymentRequestModel(
      {required this.id,
      required this.requesterId,
      required this.requesteeId,
      required this.amount,
      required this.status,
      required this.createdAt,
      required this.updatedAt});

  factory _$_PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentRequestModelFromJson(json);

  @override
  final int id;
  @override
  final int requesterId;
  @override
  final int requesteeId;
  @override
  final String amount;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'PaymentRequestModel(id: $id, requesterId: $requesterId, requesteeId: $requesteeId, amount: $amount, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.requesteeId, requesteeId) ||
                other.requesteeId == requesteeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, requesterId, requesteeId,
      amount, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentRequestModelCopyWith<_$_PaymentRequestModel> get copyWith =>
      __$$_PaymentRequestModelCopyWithImpl<_$_PaymentRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentRequestModelToJson(
      this,
    );
  }
}

abstract class _PaymentRequestModel implements PaymentRequestModel {
  factory _PaymentRequestModel(
      {required final int id,
      required final int requesterId,
      required final int requesteeId,
      required final String amount,
      required final String status,
      required final String createdAt,
      required final String updatedAt}) = _$_PaymentRequestModel;

  factory _PaymentRequestModel.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequestModel.fromJson;

  @override
  int get id;
  @override
  int get requesterId;
  @override
  int get requesteeId;
  @override
  String get amount;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentRequestModelCopyWith<_$_PaymentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
