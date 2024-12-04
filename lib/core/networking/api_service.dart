import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/core/shared_models/default_api_response.dart';
import 'package:waie/core/shared_models/look_ups/brand_lookup.dart';
import 'package:waie/core/shared_models/look_ups/category_lookup.dart';
import 'package:waie/core/shared_models/look_ups/colors_lookup.dart';
import 'package:waie/core/shared_models/look_ups/lookup_response.dart';
import 'package:waie/core/shared_models/look_ups/material_lookup.dart';
import 'package:waie/core/shared_models/look_ups/product_status_lookup.dart';
import 'package:waie/core/shared_models/look_ups/style_lookup.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address_response.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/get_addresses.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/update_address.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_request.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_response.dart';
import 'package:waie/features/auth/model/refresh_token_request_body.dart';
import 'package:waie/features/auth/model/refresh_token_response.dart';
import 'package:waie/features/cart/data/model/add_to_cart_item_request.dart';
import 'package:waie/features/cart/data/model/get_cart_items.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_request.dart';
import 'package:waie/features/cart/data/model/order_models/create_order_response.dart';
import 'package:waie/features/cart/data/model/order_models/get_orders.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_request_wrapper.dart';
import 'package:waie/features/cart/data/model/order_models/pay_order_response.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';
import 'package:waie/features/home/data/model/category_response.dart';
import 'package:waie/features/home/data/model/services/create_service_request.dart';
import 'package:waie/features/home/data/model/services/create_service_response.dart';
import 'package:waie/features/home/data/model/services/get_user_services.dart';
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

  @POST(ApiConsts.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
      @Body() RefreshTokenRequestBody body);

  // home
  @GET(ApiConsts.categories)
  Future<CategoryResponse> getCategories();

  // products list with pagination
  @GET(ApiConsts.Product)
  Future<ProductResponse> getProduct({
    @Query('PageNumber') required int pageNumber,
    @Query('PageSize') required int pageSize,
    @Query('CategoryId') int? categoryId,
    @Query('Name') String? name,
    @Query('MinPrice') double? minPrice,
    @Query('MaxPrice') double? maxPrice,
    @Query('Color') int? color,
    @Query('BrandId') int? brandId,
    @Query('StyleId') int? styleId,
    @Query('MaterialId') int? materialId,
    @Query('ProductStatus') int? productStatus,
    @Query('SortBy') String? sortBy,
    @Query('IsDescending') bool? isDescending,
  });

  // Lookup endpoints
  @GET(ApiConsts.getColors)
  Future<LookupResponse<ColorsLookUp>> getColors();

  @GET(ApiConsts.getCategories)
  Future<LookupResponse<CategoryLookUp>> getCategoryLookup();

  @GET(ApiConsts.getBrands)
  Future<LookupResponse<BrandLookUp>> getBrands();

  @GET(ApiConsts.getStyles)
  Future<LookupResponse<StyleLookUp>> getStyles();

  @GET(ApiConsts.getMaterials)
  Future<LookupResponse<MaterialLookUp>> getMaterials();

  @GET(ApiConsts.getProductStatuses)
  Future<LookupResponse<ProductStatusLookUp>> getProductStatuses();

  @POST(ApiConsts.updateUser)
  Future<UpdateUserResponse> updateUser(
      @Body() UpdateUserRequest updateUserRequest);

  // Get addresses
  @GET(ApiConsts.getAddresses)
  Future<GetAddresses> getAddresses();

  // Create address
  @POST(ApiConsts.createAddress)
  Future<CreateAddressResponse> createAddress(
      @Body() CreateAddress createAddress);

  // Update address
  @PUT(ApiConsts.updateAddress)
  Future<DefaultApiResponse> updateAddress(@Body() UpdateAddress updateAddress);

  // Add item to cart
  @POST(ApiConsts.addItemToCart)
  Future<DefaultApiResponse> addItemToCart(
      @Body() AddToCartItemRequest request);

  // Remove item from cart
  @POST(ApiConsts.removeItemFromCart)
  Future<DefaultApiResponse> removeItemFromCart(
      @Body() RemoveFromCartItemRequest request);

  // Get Cart Items
  @GET(ApiConsts.getCartItems)
  Future<GetCartItems> getCartItems();

  // Create Order
  @POST(ApiConsts.createOrder)
  Future<CreateOrderResponse> createOrder(@Body() CreateOrderRequest request);

  // Pay Order
  @POST(ApiConsts.payOrder)
  Future<PayOrderResponse> payOrder(
    @Path('OrderId') int orderId,
    // @Query('OrderId') int orderIdQuery,
    @Body() PayOrderRequest request,
  );

  // Get Orders
  @GET(ApiConsts.getOrders)
  Future<GetOrders> getOrders();

  // Create Service Request
  @POST(ApiConsts.createService)
  Future<CreateServiceResponse> createService(
    @Body() CreateServiceRequest request,
  );

  // Get User Services
  @GET(ApiConsts.getUserServices)
  Future<GetUserServices> getUserServices();
}
