// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_product_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyProductDataModel _$MyProductDataModelFromJson(Map<String, dynamic> json) {
  return _MyProductDataModel.fromJson(json);
}

/// @nodoc
mixin _$MyProductDataModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @StringToIntConverter()
  int get quantity => throw _privateConstructorUsedError;
  @StringToIntConverter()
  int get price => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProductDataModelCopyWith<MyProductDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProductDataModelCopyWith<$Res> {
  factory $MyProductDataModelCopyWith(
          MyProductDataModel value, $Res Function(MyProductDataModel) then) =
      _$MyProductDataModelCopyWithImpl<$Res, MyProductDataModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String link,
      @StringToIntConverter() int quantity,
      @StringToIntConverter() int price,
      String? image,
      String? description,
      int userId,
      String? category,
      String createdAt});
}

/// @nodoc
class _$MyProductDataModelCopyWithImpl<$Res, $Val extends MyProductDataModel>
    implements $MyProductDataModelCopyWith<$Res> {
  _$MyProductDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? link = null,
    Object? quantity = null,
    Object? price = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? userId = null,
    Object? category = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyProductDataModelCopyWith<$Res>
    implements $MyProductDataModelCopyWith<$Res> {
  factory _$$_MyProductDataModelCopyWith(_$_MyProductDataModel value,
          $Res Function(_$_MyProductDataModel) then) =
      __$$_MyProductDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String link,
      @StringToIntConverter() int quantity,
      @StringToIntConverter() int price,
      String? image,
      String? description,
      int userId,
      String? category,
      String createdAt});
}

/// @nodoc
class __$$_MyProductDataModelCopyWithImpl<$Res>
    extends _$MyProductDataModelCopyWithImpl<$Res, _$_MyProductDataModel>
    implements _$$_MyProductDataModelCopyWith<$Res> {
  __$$_MyProductDataModelCopyWithImpl(
      _$_MyProductDataModel _value, $Res Function(_$_MyProductDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? link = null,
    Object? quantity = null,
    Object? price = null,
    Object? image = freezed,
    Object? description = freezed,
    Object? userId = null,
    Object? category = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$_MyProductDataModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyProductDataModel implements _MyProductDataModel {
  _$_MyProductDataModel(
      {required this.id,
      required this.title,
      required this.link,
      @StringToIntConverter() required this.quantity,
      @StringToIntConverter() required this.price,
      required this.image,
      required this.description,
      required this.userId,
      required this.category,
      required this.createdAt});

  factory _$_MyProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyProductDataModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String link;
  @override
  @StringToIntConverter()
  final int quantity;
  @override
  @StringToIntConverter()
  final int price;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final int userId;
  @override
  final String? category;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'MyProductDataModel(id: $id, title: $title, link: $link, quantity: $quantity, price: $price, image: $image, description: $description, userId: $userId, category: $category, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyProductDataModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, link, quantity, price,
      image, description, userId, category, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyProductDataModelCopyWith<_$_MyProductDataModel> get copyWith =>
      __$$_MyProductDataModelCopyWithImpl<_$_MyProductDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyProductDataModelToJson(
      this,
    );
  }
}

abstract class _MyProductDataModel implements MyProductDataModel {
  factory _MyProductDataModel(
      {required final int id,
      required final String title,
      required final String link,
      @StringToIntConverter() required final int quantity,
      @StringToIntConverter() required final int price,
      required final String? image,
      required final String? description,
      required final int userId,
      required final String? category,
      required final String createdAt}) = _$_MyProductDataModel;

  factory _MyProductDataModel.fromJson(Map<String, dynamic> json) =
      _$_MyProductDataModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get link;
  @override
  @StringToIntConverter()
  int get quantity;
  @override
  @StringToIntConverter()
  int get price;
  @override
  String? get image;
  @override
  String? get description;
  @override
  int get userId;
  @override
  String? get category;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MyProductDataModelCopyWith<_$_MyProductDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
