// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyProductModel _$MyProductModelFromJson(Map<String, dynamic> json) {
  return _MyProductModel.fromJson(json);
}

/// @nodoc
mixin _$MyProductModel {
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  List<MyProductDataModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProductModelCopyWith<MyProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProductModelCopyWith<$Res> {
  factory $MyProductModelCopyWith(
          MyProductModel value, $Res Function(MyProductModel) then) =
      _$MyProductModelCopyWithImpl<$Res, MyProductModel>;
  @useResult
  $Res call(
      {int total,
      int totalPages,
      int currentPage,
      List<MyProductDataModel> products});
}

/// @nodoc
class _$MyProductModelCopyWithImpl<$Res, $Val extends MyProductModel>
    implements $MyProductModelCopyWith<$Res> {
  _$MyProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MyProductDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyProductModelCopyWith<$Res>
    implements $MyProductModelCopyWith<$Res> {
  factory _$$_MyProductModelCopyWith(
          _$_MyProductModel value, $Res Function(_$_MyProductModel) then) =
      __$$_MyProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int totalPages,
      int currentPage,
      List<MyProductDataModel> products});
}

/// @nodoc
class __$$_MyProductModelCopyWithImpl<$Res>
    extends _$MyProductModelCopyWithImpl<$Res, _$_MyProductModel>
    implements _$$_MyProductModelCopyWith<$Res> {
  __$$_MyProductModelCopyWithImpl(
      _$_MyProductModel _value, $Res Function(_$_MyProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalPages = null,
    Object? currentPage = null,
    Object? products = null,
  }) {
    return _then(_$_MyProductModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MyProductDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyProductModel implements _MyProductModel {
  _$_MyProductModel(
      {required this.total,
      required this.totalPages,
      required this.currentPage,
      required final List<MyProductDataModel> products})
      : _products = products;

  factory _$_MyProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyProductModelFromJson(json);

  @override
  final int total;
  @override
  final int totalPages;
  @override
  final int currentPage;
  final List<MyProductDataModel> _products;
  @override
  List<MyProductDataModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'MyProductModel(total: $total, totalPages: $totalPages, currentPage: $currentPage, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyProductModel &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, totalPages, currentPage,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyProductModelCopyWith<_$_MyProductModel> get copyWith =>
      __$$_MyProductModelCopyWithImpl<_$_MyProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyProductModelToJson(
      this,
    );
  }
}

abstract class _MyProductModel implements MyProductModel {
  factory _MyProductModel(
      {required final int total,
      required final int totalPages,
      required final int currentPage,
      required final List<MyProductDataModel> products}) = _$_MyProductModel;

  factory _MyProductModel.fromJson(Map<String, dynamic> json) =
      _$_MyProductModel.fromJson;

  @override
  int get total;
  @override
  int get totalPages;
  @override
  int get currentPage;
  @override
  List<MyProductDataModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_MyProductModelCopyWith<_$_MyProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
