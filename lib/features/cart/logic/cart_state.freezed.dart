// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CartInitialImplCopyWith<$Res> {
  factory _$$CartInitialImplCopyWith(
          _$CartInitialImpl value, $Res Function(_$CartInitialImpl) then) =
      __$$CartInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartInitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartInitialImpl>
    implements _$$CartInitialImplCopyWith<$Res> {
  __$$CartInitialImplCopyWithImpl(
      _$CartInitialImpl _value, $Res Function(_$CartInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CartInitialImpl implements _CartInitial {
  const _$CartInitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
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
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _CartInitial implements CartState {
  const factory _CartInitial() = _$CartInitialImpl;
}

/// @nodoc
abstract class _$$CartLoadingImplCopyWith<$Res> {
  factory _$$CartLoadingImplCopyWith(
          _$CartLoadingImpl value, $Res Function(_$CartLoadingImpl) then) =
      __$$CartLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartLoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartLoadingImpl>
    implements _$$CartLoadingImplCopyWith<$Res> {
  __$$CartLoadingImplCopyWithImpl(
      _$CartLoadingImpl _value, $Res Function(_$CartLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CartLoadingImpl implements _CartLoading {
  const _$CartLoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _CartLoading implements CartState {
  const factory _CartLoading() = _$CartLoadingImpl;
}

/// @nodoc
abstract class _$$CartItemAddedImplCopyWith<$Res> {
  factory _$$CartItemAddedImplCopyWith(
          _$CartItemAddedImpl value, $Res Function(_$CartItemAddedImpl) then) =
      __$$CartItemAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$CartItemAddedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartItemAddedImpl>
    implements _$$CartItemAddedImplCopyWith<$Res> {
  __$$CartItemAddedImplCopyWithImpl(
      _$CartItemAddedImpl _value, $Res Function(_$CartItemAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartItemAddedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$CartItemAddedImpl implements _CartItemAdded {
  const _$CartItemAddedImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.itemAdded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemAddedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemAddedImplCopyWith<_$CartItemAddedImpl> get copyWith =>
      __$$CartItemAddedImplCopyWithImpl<_$CartItemAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return itemAdded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemAdded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return itemAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return itemAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(this);
    }
    return orElse();
  }
}

abstract class _CartItemAdded implements CartState {
  const factory _CartItemAdded(final DefaultApiResponse data) =
      _$CartItemAddedImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemAddedImplCopyWith<_$CartItemAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemRemovedImplCopyWith<$Res> {
  factory _$$CartItemRemovedImplCopyWith(_$CartItemRemovedImpl value,
          $Res Function(_$CartItemRemovedImpl) then) =
      __$$CartItemRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$CartItemRemovedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartItemRemovedImpl>
    implements _$$CartItemRemovedImplCopyWith<$Res> {
  __$$CartItemRemovedImplCopyWithImpl(
      _$CartItemRemovedImpl _value, $Res Function(_$CartItemRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartItemRemovedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$CartItemRemovedImpl implements _CartItemRemoved {
  const _$CartItemRemovedImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.itemRemoved(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemRemovedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemRemovedImplCopyWith<_$CartItemRemovedImpl> get copyWith =>
      __$$CartItemRemovedImplCopyWithImpl<_$CartItemRemovedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return itemRemoved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return itemRemoved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (itemRemoved != null) {
      return itemRemoved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return itemRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return itemRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (itemRemoved != null) {
      return itemRemoved(this);
    }
    return orElse();
  }
}

abstract class _CartItemRemoved implements CartState {
  const factory _CartItemRemoved(final DefaultApiResponse data) =
      _$CartItemRemovedImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemRemovedImplCopyWith<_$CartItemRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartItemsFetchedImplCopyWith<$Res> {
  factory _$$CartItemsFetchedImplCopyWith(_$CartItemsFetchedImpl value,
          $Res Function(_$CartItemsFetchedImpl) then) =
      __$$CartItemsFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetCartItems data});
}

/// @nodoc
class __$$CartItemsFetchedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartItemsFetchedImpl>
    implements _$$CartItemsFetchedImplCopyWith<$Res> {
  __$$CartItemsFetchedImplCopyWithImpl(_$CartItemsFetchedImpl _value,
      $Res Function(_$CartItemsFetchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartItemsFetchedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetCartItems,
    ));
  }
}

/// @nodoc

class _$CartItemsFetchedImpl implements _CartItemsFetched {
  const _$CartItemsFetchedImpl(this.data);

  @override
  final GetCartItems data;

  @override
  String toString() {
    return 'CartState.cartItemsFetched(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemsFetchedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemsFetchedImplCopyWith<_$CartItemsFetchedImpl> get copyWith =>
      __$$CartItemsFetchedImplCopyWithImpl<_$CartItemsFetchedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return cartItemsFetched(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return cartItemsFetched?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (cartItemsFetched != null) {
      return cartItemsFetched(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return cartItemsFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return cartItemsFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (cartItemsFetched != null) {
      return cartItemsFetched(this);
    }
    return orElse();
  }
}

abstract class _CartItemsFetched implements CartState {
  const factory _CartItemsFetched(final GetCartItems data) =
      _$CartItemsFetchedImpl;

  GetCartItems get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemsFetchedImplCopyWith<_$CartItemsFetchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartSuccessImplCopyWith<$Res> {
  factory _$$CartSuccessImplCopyWith(
          _$CartSuccessImpl value, $Res Function(_$CartSuccessImpl) then) =
      __$$CartSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefaultApiResponse data});
}

/// @nodoc
class __$$CartSuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartSuccessImpl>
    implements _$$CartSuccessImplCopyWith<$Res> {
  __$$CartSuccessImplCopyWithImpl(
      _$CartSuccessImpl _value, $Res Function(_$CartSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CartSuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DefaultApiResponse,
    ));
  }
}

/// @nodoc

class _$CartSuccessImpl implements _CartSuccess {
  const _$CartSuccessImpl(this.data);

  @override
  final DefaultApiResponse data;

  @override
  String toString() {
    return 'CartState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSuccessImplCopyWith<_$CartSuccessImpl> get copyWith =>
      __$$CartSuccessImplCopyWithImpl<_$CartSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _CartSuccess implements CartState {
  const factory _CartSuccess(final DefaultApiResponse data) = _$CartSuccessImpl;

  DefaultApiResponse get data;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartSuccessImplCopyWith<_$CartSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartErrorImplCopyWith<$Res> {
  factory _$$CartErrorImplCopyWith(
          _$CartErrorImpl value, $Res Function(_$CartErrorImpl) then) =
      __$$CartErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CartErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartErrorImpl>
    implements _$$CartErrorImplCopyWith<$Res> {
  __$$CartErrorImplCopyWithImpl(
      _$CartErrorImpl _value, $Res Function(_$CartErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CartErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartErrorImpl implements _CartError {
  const _$CartErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CartState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      __$$CartErrorImplCopyWithImpl<_$CartErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DefaultApiResponse data) itemAdded,
    required TResult Function(DefaultApiResponse data) itemRemoved,
    required TResult Function(GetCartItems data) cartItemsFetched,
    required TResult Function(DefaultApiResponse data) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DefaultApiResponse data)? itemAdded,
    TResult? Function(DefaultApiResponse data)? itemRemoved,
    TResult? Function(GetCartItems data)? cartItemsFetched,
    TResult? Function(DefaultApiResponse data)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DefaultApiResponse data)? itemAdded,
    TResult Function(DefaultApiResponse data)? itemRemoved,
    TResult Function(GetCartItems data)? cartItemsFetched,
    TResult Function(DefaultApiResponse data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartInitial value) initial,
    required TResult Function(_CartLoading value) loading,
    required TResult Function(_CartItemAdded value) itemAdded,
    required TResult Function(_CartItemRemoved value) itemRemoved,
    required TResult Function(_CartItemsFetched value) cartItemsFetched,
    required TResult Function(_CartSuccess value) success,
    required TResult Function(_CartError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartInitial value)? initial,
    TResult? Function(_CartLoading value)? loading,
    TResult? Function(_CartItemAdded value)? itemAdded,
    TResult? Function(_CartItemRemoved value)? itemRemoved,
    TResult? Function(_CartItemsFetched value)? cartItemsFetched,
    TResult? Function(_CartSuccess value)? success,
    TResult? Function(_CartError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartInitial value)? initial,
    TResult Function(_CartLoading value)? loading,
    TResult Function(_CartItemAdded value)? itemAdded,
    TResult Function(_CartItemRemoved value)? itemRemoved,
    TResult Function(_CartItemsFetched value)? cartItemsFetched,
    TResult Function(_CartSuccess value)? success,
    TResult Function(_CartError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _CartError implements CartState {
  const factory _CartError({required final String error}) = _$CartErrorImpl;

  String get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
