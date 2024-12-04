// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) productLoading,
    required TResult Function(List<Product> products) productSuccess,
    required TResult Function(ErrorHandler errorHandler) productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? productLoading,
    TResult? Function(List<Product> products)? productSuccess,
    TResult? Function(ErrorHandler errorHandler)? productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> products)? productLoading,
    TResult Function(List<Product> products)? productSuccess,
    TResult Function(ErrorHandler errorHandler)? productError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProductLoading value) productLoading,
    required TResult Function(ProductSuccess value) productSuccess,
    required TResult Function(ProductError value) productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProductLoading value)? productLoading,
    TResult? Function(ProductSuccess value)? productSuccess,
    TResult? Function(ProductError value)? productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProductLoading value)? productLoading,
    TResult Function(ProductSuccess value)? productSuccess,
    TResult Function(ProductError value)? productError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) productLoading,
    required TResult Function(List<Product> products) productSuccess,
    required TResult Function(ErrorHandler errorHandler) productError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? productLoading,
    TResult? Function(List<Product> products)? productSuccess,
    TResult? Function(ErrorHandler errorHandler)? productError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> products)? productLoading,
    TResult Function(List<Product> products)? productSuccess,
    TResult Function(ErrorHandler errorHandler)? productError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProductLoading value) productLoading,
    required TResult Function(ProductSuccess value) productSuccess,
    required TResult Function(ProductError value) productError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProductLoading value)? productLoading,
    TResult? Function(ProductSuccess value)? productSuccess,
    TResult? Function(ProductError value)? productError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProductLoading value)? productLoading,
    TResult Function(ProductSuccess value)? productSuccess,
    TResult Function(ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProductLoadingImplCopyWith<$Res> {
  factory _$$ProductLoadingImplCopyWith(_$ProductLoadingImpl value,
          $Res Function(_$ProductLoadingImpl) then) =
      __$$ProductLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$ProductLoadingImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductLoadingImpl>
    implements _$$ProductLoadingImplCopyWith<$Res> {
  __$$ProductLoadingImplCopyWithImpl(
      _$ProductLoadingImpl _value, $Res Function(_$ProductLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductLoadingImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductLoadingImpl implements ProductLoading {
  const _$ProductLoadingImpl(final List<Product> products)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductState.productLoading(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLoadingImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLoadingImplCopyWith<_$ProductLoadingImpl> get copyWith =>
      __$$ProductLoadingImplCopyWithImpl<_$ProductLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) productLoading,
    required TResult Function(List<Product> products) productSuccess,
    required TResult Function(ErrorHandler errorHandler) productError,
  }) {
    return productLoading(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? productLoading,
    TResult? Function(List<Product> products)? productSuccess,
    TResult? Function(ErrorHandler errorHandler)? productError,
  }) {
    return productLoading?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> products)? productLoading,
    TResult Function(List<Product> products)? productSuccess,
    TResult Function(ErrorHandler errorHandler)? productError,
    required TResult orElse(),
  }) {
    if (productLoading != null) {
      return productLoading(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProductLoading value) productLoading,
    required TResult Function(ProductSuccess value) productSuccess,
    required TResult Function(ProductError value) productError,
  }) {
    return productLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProductLoading value)? productLoading,
    TResult? Function(ProductSuccess value)? productSuccess,
    TResult? Function(ProductError value)? productError,
  }) {
    return productLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProductLoading value)? productLoading,
    TResult Function(ProductSuccess value)? productSuccess,
    TResult Function(ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (productLoading != null) {
      return productLoading(this);
    }
    return orElse();
  }
}

abstract class ProductLoading implements ProductState {
  const factory ProductLoading(final List<Product> products) =
      _$ProductLoadingImpl;

  List<Product> get products;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductLoadingImplCopyWith<_$ProductLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductSuccessImplCopyWith<$Res> {
  factory _$$ProductSuccessImplCopyWith(_$ProductSuccessImpl value,
          $Res Function(_$ProductSuccessImpl) then) =
      __$$ProductSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$ProductSuccessImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductSuccessImpl>
    implements _$$ProductSuccessImplCopyWith<$Res> {
  __$$ProductSuccessImplCopyWithImpl(
      _$ProductSuccessImpl _value, $Res Function(_$ProductSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductSuccessImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductSuccessImpl implements ProductSuccess {
  const _$ProductSuccessImpl(final List<Product> products)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductState.productSuccess(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSuccessImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSuccessImplCopyWith<_$ProductSuccessImpl> get copyWith =>
      __$$ProductSuccessImplCopyWithImpl<_$ProductSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) productLoading,
    required TResult Function(List<Product> products) productSuccess,
    required TResult Function(ErrorHandler errorHandler) productError,
  }) {
    return productSuccess(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? productLoading,
    TResult? Function(List<Product> products)? productSuccess,
    TResult? Function(ErrorHandler errorHandler)? productError,
  }) {
    return productSuccess?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> products)? productLoading,
    TResult Function(List<Product> products)? productSuccess,
    TResult Function(ErrorHandler errorHandler)? productError,
    required TResult orElse(),
  }) {
    if (productSuccess != null) {
      return productSuccess(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProductLoading value) productLoading,
    required TResult Function(ProductSuccess value) productSuccess,
    required TResult Function(ProductError value) productError,
  }) {
    return productSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProductLoading value)? productLoading,
    TResult? Function(ProductSuccess value)? productSuccess,
    TResult? Function(ProductError value)? productError,
  }) {
    return productSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProductLoading value)? productLoading,
    TResult Function(ProductSuccess value)? productSuccess,
    TResult Function(ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (productSuccess != null) {
      return productSuccess(this);
    }
    return orElse();
  }
}

abstract class ProductSuccess implements ProductState {
  const factory ProductSuccess(final List<Product> products) =
      _$ProductSuccessImpl;

  List<Product> get products;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSuccessImplCopyWith<_$ProductSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductErrorImplCopyWith<$Res> {
  factory _$$ProductErrorImplCopyWith(
          _$ProductErrorImpl value, $Res Function(_$ProductErrorImpl) then) =
      __$$ProductErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$ProductErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductErrorImpl>
    implements _$$ProductErrorImplCopyWith<$Res> {
  __$$ProductErrorImplCopyWithImpl(
      _$ProductErrorImpl _value, $Res Function(_$ProductErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$ProductErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$ProductErrorImpl implements ProductError {
  const _$ProductErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'ProductState.productError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductErrorImplCopyWith<_$ProductErrorImpl> get copyWith =>
      __$$ProductErrorImplCopyWithImpl<_$ProductErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Product> products) productLoading,
    required TResult Function(List<Product> products) productSuccess,
    required TResult Function(ErrorHandler errorHandler) productError,
  }) {
    return productError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Product> products)? productLoading,
    TResult? Function(List<Product> products)? productSuccess,
    TResult? Function(ErrorHandler errorHandler)? productError,
  }) {
    return productError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Product> products)? productLoading,
    TResult Function(List<Product> products)? productSuccess,
    TResult Function(ErrorHandler errorHandler)? productError,
    required TResult orElse(),
  }) {
    if (productError != null) {
      return productError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ProductLoading value) productLoading,
    required TResult Function(ProductSuccess value) productSuccess,
    required TResult Function(ProductError value) productError,
  }) {
    return productError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ProductLoading value)? productLoading,
    TResult? Function(ProductSuccess value)? productSuccess,
    TResult? Function(ProductError value)? productError,
  }) {
    return productError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ProductLoading value)? productLoading,
    TResult Function(ProductSuccess value)? productSuccess,
    TResult Function(ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (productError != null) {
      return productError(this);
    }
    return orElse();
  }
}

abstract class ProductError implements ProductState {
  const factory ProductError(final ErrorHandler errorHandler) =
      _$ProductErrorImpl;

  ErrorHandler get errorHandler;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductErrorImplCopyWith<_$ProductErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
