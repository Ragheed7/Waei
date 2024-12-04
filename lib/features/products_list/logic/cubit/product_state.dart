import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.productLoading(List<Product> products) = ProductLoading;

  const factory ProductState.productSuccess(List<Product> products) = ProductSuccess;

  const factory ProductState.productError(ErrorHandler errorHandler) = ProductError;
}
