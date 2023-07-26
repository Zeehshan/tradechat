// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) {
  return _InvoiceModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get total => throw _privateConstructorUsedError;
  String get deliveryTerm => throw _privateConstructorUsedError;
  String get paymentTerm => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  BundleModel? get bundle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceModelCopyWith<InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceModelCopyWith<$Res> {
  factory $InvoiceModelCopyWith(
          InvoiceModel value, $Res Function(InvoiceModel) then) =
      _$InvoiceModelCopyWithImpl<$Res, InvoiceModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      String number,
      String date,
      String total,
      String deliveryTerm,
      String paymentTerm,
      String createdAt,
      String updatedAt,
      BundleModel? bundle});

  $BundleModelCopyWith<$Res>? get bundle;
}

/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res, $Val extends InvoiceModel>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? number = null,
    Object? date = null,
    Object? total = null,
    Object? deliveryTerm = null,
    Object? paymentTerm = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? bundle = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTerm: null == deliveryTerm
          ? _value.deliveryTerm
          : deliveryTerm // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      bundle: freezed == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as BundleModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleModelCopyWith<$Res>? get bundle {
    if (_value.bundle == null) {
      return null;
    }

    return $BundleModelCopyWith<$Res>(_value.bundle!, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InvoiceModelCopyWith<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  factory _$$_InvoiceModelCopyWith(
          _$_InvoiceModel value, $Res Function(_$_InvoiceModel) then) =
      __$$_InvoiceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int userId,
      String number,
      String date,
      String total,
      String deliveryTerm,
      String paymentTerm,
      String createdAt,
      String updatedAt,
      BundleModel? bundle});

  @override
  $BundleModelCopyWith<$Res>? get bundle;
}

/// @nodoc
class __$$_InvoiceModelCopyWithImpl<$Res>
    extends _$InvoiceModelCopyWithImpl<$Res, _$_InvoiceModel>
    implements _$$_InvoiceModelCopyWith<$Res> {
  __$$_InvoiceModelCopyWithImpl(
      _$_InvoiceModel _value, $Res Function(_$_InvoiceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = null,
    Object? number = null,
    Object? date = null,
    Object? total = null,
    Object? deliveryTerm = null,
    Object? paymentTerm = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? bundle = freezed,
  }) {
    return _then(_$_InvoiceModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTerm: null == deliveryTerm
          ? _value.deliveryTerm
          : deliveryTerm // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      bundle: freezed == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as BundleModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvoiceModel implements _InvoiceModel {
  _$_InvoiceModel(
      {required this.id,
      required this.name,
      required this.userId,
      required this.number,
      required this.date,
      required this.total,
      required this.deliveryTerm,
      required this.paymentTerm,
      required this.createdAt,
      required this.updatedAt,
      this.bundle});

  factory _$_InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int userId;
  @override
  final String number;
  @override
  final String date;
  @override
  final String total;
  @override
  final String deliveryTerm;
  @override
  final String paymentTerm;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final BundleModel? bundle;

  @override
  String toString() {
    return 'InvoiceModel(id: $id, name: $name, userId: $userId, number: $number, date: $date, total: $total, deliveryTerm: $deliveryTerm, paymentTerm: $paymentTerm, createdAt: $createdAt, updatedAt: $updatedAt, bundle: $bundle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.deliveryTerm, deliveryTerm) ||
                other.deliveryTerm == deliveryTerm) &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.bundle, bundle) || other.bundle == bundle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId, number, date,
      total, deliveryTerm, paymentTerm, createdAt, updatedAt, bundle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceModelCopyWith<_$_InvoiceModel> get copyWith =>
      __$$_InvoiceModelCopyWithImpl<_$_InvoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceModelToJson(
      this,
    );
  }
}

abstract class _InvoiceModel implements InvoiceModel {
  factory _InvoiceModel(
      {required final int id,
      required final String name,
      required final int userId,
      required final String number,
      required final String date,
      required final String total,
      required final String deliveryTerm,
      required final String paymentTerm,
      required final String createdAt,
      required final String updatedAt,
      final BundleModel? bundle}) = _$_InvoiceModel;

  factory _InvoiceModel.fromJson(Map<String, dynamic> json) =
      _$_InvoiceModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get userId;
  @override
  String get number;
  @override
  String get date;
  @override
  String get total;
  @override
  String get deliveryTerm;
  @override
  String get paymentTerm;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  BundleModel? get bundle;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceModelCopyWith<_$_InvoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BundleModel _$BundleModelFromJson(Map<String, dynamic> json) {
  return _BundleModel.fromJson(json);
}

/// @nodoc
mixin _$BundleModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<OrderProductModel> get orderProducts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleModelCopyWith<BundleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleModelCopyWith<$Res> {
  factory $BundleModelCopyWith(
          BundleModel value, $Res Function(BundleModel) then) =
      _$BundleModelCopyWithImpl<$Res, BundleModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? image,
      int userId,
      String createdAt,
      String updatedAt,
      List<OrderProductModel> orderProducts});
}

/// @nodoc
class _$BundleModelCopyWithImpl<$Res, $Val extends BundleModel>
    implements $BundleModelCopyWith<$Res> {
  _$BundleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orderProducts = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: null == orderProducts
          ? _value.orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BundleModelCopyWith<$Res>
    implements $BundleModelCopyWith<$Res> {
  factory _$$_BundleModelCopyWith(
          _$_BundleModel value, $Res Function(_$_BundleModel) then) =
      __$$_BundleModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? image,
      int userId,
      String createdAt,
      String updatedAt,
      List<OrderProductModel> orderProducts});
}

/// @nodoc
class __$$_BundleModelCopyWithImpl<$Res>
    extends _$BundleModelCopyWithImpl<$Res, _$_BundleModel>
    implements _$$_BundleModelCopyWith<$Res> {
  __$$_BundleModelCopyWithImpl(
      _$_BundleModel _value, $Res Function(_$_BundleModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orderProducts = null,
  }) {
    return _then(_$_BundleModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderProducts: null == orderProducts
          ? _value._orderProducts
          : orderProducts // ignore: cast_nullable_to_non_nullable
              as List<OrderProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BundleModel implements _BundleModel {
  _$_BundleModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      required final List<OrderProductModel> orderProducts})
      : _orderProducts = orderProducts;

  factory _$_BundleModel.fromJson(Map<String, dynamic> json) =>
      _$$_BundleModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? image;
  @override
  final int userId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<OrderProductModel> _orderProducts;
  @override
  List<OrderProductModel> get orderProducts {
    if (_orderProducts is EqualUnmodifiableListView) return _orderProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderProducts);
  }

  @override
  String toString() {
    return 'BundleModel(id: $id, name: $name, image: $image, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, orderProducts: $orderProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._orderProducts, _orderProducts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      image,
      userId,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_orderProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BundleModelCopyWith<_$_BundleModel> get copyWith =>
      __$$_BundleModelCopyWithImpl<_$_BundleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundleModelToJson(
      this,
    );
  }
}

abstract class _BundleModel implements BundleModel {
  factory _BundleModel(
      {required final int id,
      required final String name,
      required final String? image,
      required final int userId,
      required final String createdAt,
      required final String updatedAt,
      required final List<OrderProductModel> orderProducts}) = _$_BundleModel;

  factory _BundleModel.fromJson(Map<String, dynamic> json) =
      _$_BundleModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get image;
  @override
  int get userId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<OrderProductModel> get orderProducts;
  @override
  @JsonKey(ignore: true)
  _$$_BundleModelCopyWith<_$_BundleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) {
  return _OrderProductModel.fromJson(json);
}

/// @nodoc
mixin _$OrderProductModel {
  int get id => throw _privateConstructorUsedError;
  int get orderId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Product')
  ProductModel? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderProductModelCopyWith<OrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductModelCopyWith<$Res> {
  factory $OrderProductModelCopyWith(
          OrderProductModel value, $Res Function(OrderProductModel) then) =
      _$OrderProductModelCopyWithImpl<$Res, OrderProductModel>;
  @useResult
  $Res call(
      {int id,
      int orderId,
      int quantity,
      String createdAt,
      String updatedAt,
      int productId,
      @JsonKey(name: 'Product') ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res, $Val extends OrderProductModel>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productId = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderProductModelCopyWith<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  factory _$$_OrderProductModelCopyWith(_$_OrderProductModel value,
          $Res Function(_$_OrderProductModel) then) =
      __$$_OrderProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int orderId,
      int quantity,
      String createdAt,
      String updatedAt,
      int productId,
      @JsonKey(name: 'Product') ProductModel? product});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_OrderProductModelCopyWithImpl<$Res>
    extends _$OrderProductModelCopyWithImpl<$Res, _$_OrderProductModel>
    implements _$$_OrderProductModelCopyWith<$Res> {
  __$$_OrderProductModelCopyWithImpl(
      _$_OrderProductModel _value, $Res Function(_$_OrderProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productId = null,
    Object? product = freezed,
  }) {
    return _then(_$_OrderProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderProductModel implements _OrderProductModel {
  _$_OrderProductModel(
      {required this.id,
      required this.orderId,
      required this.quantity,
      required this.createdAt,
      required this.updatedAt,
      required this.productId,
      @JsonKey(name: 'Product') required this.product});

  factory _$_OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderProductModelFromJson(json);

  @override
  final int id;
  @override
  final int orderId;
  @override
  final int quantity;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int productId;
  @override
  @JsonKey(name: 'Product')
  final ProductModel? product;

  @override
  String toString() {
    return 'OrderProductModel(id: $id, orderId: $orderId, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt, productId: $productId, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderId, quantity, createdAt,
      updatedAt, productId, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderProductModelCopyWith<_$_OrderProductModel> get copyWith =>
      __$$_OrderProductModelCopyWithImpl<_$_OrderProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderProductModelToJson(
      this,
    );
  }
}

abstract class _OrderProductModel implements OrderProductModel {
  factory _OrderProductModel(
          {required final int id,
          required final int orderId,
          required final int quantity,
          required final String createdAt,
          required final String updatedAt,
          required final int productId,
          @JsonKey(name: 'Product') required final ProductModel? product}) =
      _$_OrderProductModel;

  factory _OrderProductModel.fromJson(Map<String, dynamic> json) =
      _$_OrderProductModel.fromJson;

  @override
  int get id;
  @override
  int get orderId;
  @override
  int get quantity;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get productId;
  @override
  @JsonKey(name: 'Product')
  ProductModel? get product;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductModelCopyWith<_$_OrderProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String link,
      String? image,
      int price,
      String title,
      int userId,
      String category,
      int quantity,
      String createdAt,
      String updatedAt,
      String? description});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
    Object? userId = null,
    Object? category = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String link,
      String? image,
      int price,
      String title,
      int userId,
      String category,
      int quantity,
      String createdAt,
      String updatedAt,
      String? description});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? image = freezed,
    Object? price = null,
    Object? title = null,
    Object? userId = null,
    Object? category = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? description = freezed,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {required this.id,
      required this.link,
      required this.image,
      required this.price,
      required this.title,
      required this.userId,
      required this.category,
      required this.quantity,
      required this.createdAt,
      required this.updatedAt,
      required this.description});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String link;
  @override
  final String? image;
  @override
  final int price;
  @override
  final String title;
  @override
  final int userId;
  @override
  final String category;
  @override
  final int quantity;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? description;

  @override
  String toString() {
    return 'ProductModel(id: $id, link: $link, image: $image, price: $price, title: $title, userId: $userId, category: $category, quantity: $quantity, createdAt: $createdAt, updatedAt: $updatedAt, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, link, image, price, title,
      userId, category, quantity, createdAt, updatedAt, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required final int id,
      required final String link,
      required final String? image,
      required final int price,
      required final String title,
      required final int userId,
      required final String category,
      required final int quantity,
      required final String createdAt,
      required final String updatedAt,
      required final String? description}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get id;
  @override
  String get link;
  @override
  String? get image;
  @override
  int get price;
  @override
  String get title;
  @override
  int get userId;
  @override
  String get category;
  @override
  int get quantity;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
