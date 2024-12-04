class ApiConsts {
  static const String baseUrl = "http://finprojectapi.somee.com/api/";
  static const String serverBaseUrl = "http://finprojectapi.somee.com/";
  static const String login = "Authentication/Customer/Login";
  static const String categories = "Product/GetCategories";
  static const String Product = "Product/SearchProducts";
  static const String refreshToken = "Authentication/RefreshToken";
  static const String updateUser = 'User/UpdateUser';
  static const String createAddress = 'Address/CreateAddress';
  static const String getAddresses = 'Address/GetAddresses';
  static const String updateAddress = 'Address/UpdateAddress';
  static const String addItemToCart = 'Cart/AddCartItem';
  static const String removeItemFromCart = 'Cart/RemoveCartItem';
  static const String getCartItems = 'Cart/GetCartItems';
  static const String createOrder = 'Order/CreateOrder';
  static const String getOrders = "Order/GetOrders";
  static const String payOrder = 'Order/Pay/{OrderId}';
  static const String createService = 'ServiceRequest/CreateService';
  static const String getUserServices = 'ServiceRequest/GetCurrentUserServices';
  static const String getColors = 'Product/ProductColorLookup';
  static const String getMaterials = 'Product/GetMaterialLookUp';
  static const String getBrands = 'Product/GetBrandsLookUp';
  static const String getCategories = 'Product/GetCategoryLookUp';
  static const String getProductStatuses = 'Product/ProductStatusLookUp';
  static const String getStyles = 'Product/GetStyleLookUp';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
