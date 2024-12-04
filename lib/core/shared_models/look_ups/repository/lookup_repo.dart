import 'package:waie/core/networking/api_error_handler.dart';
import 'package:waie/core/networking/api_result.dart';
import 'package:waie/core/networking/api_service.dart';
import 'package:waie/core/shared_models/look_ups/brand_lookup.dart';
import 'package:waie/core/shared_models/look_ups/category_lookup.dart';
import 'package:waie/core/shared_models/look_ups/colors_lookup.dart';
import 'package:waie/core/shared_models/look_ups/material_lookup.dart';
import 'package:waie/core/shared_models/look_ups/product_status_lookup.dart';
import 'package:waie/core/shared_models/look_ups/style_lookup.dart';


class LookupRepository {
  final ApiService _apiService;

  LookupRepository(this._apiService);

  Future<ApiResult<List<ColorsLookUp>>> fetchColors() async {
    try {
      final response = await _apiService.getColors();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<BrandLookUp>>> fetchBrands() async {
    try {
      final response = await _apiService.getBrands();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<StyleLookUp>>> fetchStyles() async {
    try {
      final response = await _apiService.getStyles();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<MaterialLookUp>>> fetchMaterials() async {
    try {
      final response = await _apiService.getMaterials();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductStatusLookUp>>> fetchProductStatuses() async {
    try {
      final response = await _apiService.getProductStatuses();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

   Future<ApiResult<List<CategoryLookUp>>> fetchCategories() async {
    try {
      final response = await _apiService.getCategoryLookup();
      return ApiResult.success(response.result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
