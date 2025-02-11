import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/home/data/model/category_response.dart';
import 'package:waie/features/login/data/model/login_request_body.dart';
import 'package:waie/features/login/data/model/login_response.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

part 'api_service.g.dart';

//annotation for retrofit
@RestApi(baseUrl: ApiConsts.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // registering
  @POST(ApiConsts.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // home
  @GET(ApiConsts.categories)
  Future<CategoryResponse> getCategories();

  // products list with pagination
  @GET(ApiConsts.Product)
  Future<ProductResponse> getProduct({
    @Query('PageNumber') required int pageNumber,
    @Query('PageSize') required int pageSize,
    @Query('CategoryId') int? categoryId,
  });
}
