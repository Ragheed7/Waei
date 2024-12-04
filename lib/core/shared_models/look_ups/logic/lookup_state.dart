import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waie/core/shared_models/look_ups/brand_lookup.dart';
import 'package:waie/core/shared_models/look_ups/category_lookup.dart';
import 'package:waie/core/shared_models/look_ups/colors_lookup.dart';
import 'package:waie/core/shared_models/look_ups/material_lookup.dart';
import 'package:waie/core/shared_models/look_ups/product_status_lookup.dart';
import 'package:waie/core/shared_models/look_ups/style_lookup.dart';


part 'lookup_state.freezed.dart';

@freezed
class LookupState with _$LookupState {
  const factory LookupState.initial() = _Initial;
  const factory LookupState.loading() = _Loading;
  const factory LookupState.loaded({
    required List<ColorsLookUp> colors,
    required List<BrandLookUp> brands,
    required List<StyleLookUp> styles,
    required List<MaterialLookUp> materials,
    required List<ProductStatusLookUp> productStatuses,
    required List<CategoryLookUp> categories,
  }) = _Loaded;
  const factory LookupState.error({required String error}) = _Error;
}
