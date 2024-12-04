import 'package:bloc/bloc.dart';
import 'package:waie/core/shared_models/look_ups/brand_lookup.dart';
import 'package:waie/core/shared_models/look_ups/category_lookup.dart';
import 'package:waie/core/shared_models/look_ups/colors_lookup.dart';
import 'package:waie/core/shared_models/look_ups/material_lookup.dart';
import 'package:waie/core/shared_models/look_ups/product_status_lookup.dart';
import 'package:waie/core/shared_models/look_ups/repository/lookup_repo.dart';
import 'package:waie/core/shared_models/look_ups/style_lookup.dart';

import 'lookup_state.dart';

class LookupCubit extends Cubit<LookupState> {
  final LookupRepository _lookupRepository;

  LookupCubit(this._lookupRepository) : super(const LookupState.initial());

  Future<void> fetchLookups() async {
    emit(const LookupState.loading());

    try {
      final colorsResult = await _lookupRepository.fetchColors();
      final brandsResult = await _lookupRepository.fetchBrands();
      final stylesResult = await _lookupRepository.fetchStyles();
      final materialsResult = await _lookupRepository.fetchMaterials();
      final productStatusesResult = await _lookupRepository.fetchProductStatuses();
      final categoriesResult = await _lookupRepository.fetchCategories();

      final colors = colorsResult.when(
        success: (List<ColorsLookUp> data) => data,
        failure: (_) => <ColorsLookUp>[],
      );
      final brands = brandsResult.when(
        success: (List<BrandLookUp> data) => data,
        failure: (_) => <BrandLookUp>[],
      );
      final styles = stylesResult.when(
        success: (List<StyleLookUp> data) => data,
        failure: (_) => <StyleLookUp>[],
      );
      final materials = materialsResult.when(
        success: (List<MaterialLookUp> data) => data,
        failure: (_) => <MaterialLookUp>[],
      );
      final productStatuses = productStatusesResult.when(
        success: (List<ProductStatusLookUp> data) => data,
        failure: (_) => <ProductStatusLookUp>[],
      );
      final categories = categoriesResult.when(
        success: (List<CategoryLookUp> data) => data,
        failure: (_) => <CategoryLookUp>[],
      );

      emit(LookupState.loaded(
        colors: colors,
        brands: brands,
        styles: styles,
        materials: materials,
        productStatuses: productStatuses,
        categories: categories,
      ));
    } catch (e) {
      emit(LookupState.error(error: e.toString()));
    }
  } 
}
