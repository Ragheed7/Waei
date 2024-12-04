import 'package:bloc/bloc.dart';
import 'package:waie/features/products_list/data/repository/product_repo.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';
import '../../data/model/product_models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(const ProductState.initial());

  final ProductRepo _productRepo;

  List<Product> productsList = [];
  int currentPage = 1;
  final int pageSize = 8;
  bool isLoadingMore = false;
  bool hasMoreData = true;

  int? categoryId;
  String? searchQuery;
  double? minPrice;
  double? maxPrice;
  int? color;
  int? brandId;
  int? styleId;
  int? materialId;
  int? productStatus;
  String? sortBy;
  bool? isDescending;

  void getProducts({
    bool isInitialLoad = false,
    int? categoryId,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? color,
    int? brandId,
    int? styleId,
    int? materialId,
    int? productStatus,
    String? sortBy,
    bool? isDescending,
  }) async {
    if (isInitialLoad) {
      currentPage = 1;
      productsList.clear();
      hasMoreData = true;
      this.categoryId = categoryId;
      this.searchQuery = searchQuery;
      this.minPrice = minPrice;
      this.maxPrice = maxPrice;
      this.color = color;
      this.brandId = brandId;
      this.styleId = styleId;
      this.materialId = materialId;
      this.productStatus = productStatus;
      this.sortBy = sortBy;
      this.isDescending = isDescending;
    }

    if (isLoadingMore || !hasMoreData) {
      return;
    }

    isLoadingMore = true;
    emit(ProductState.productLoading(productsList));

    final response = await _productRepo.getProduct(
      pageNumber: currentPage,
      pageSize: pageSize,
      categoryId: this.categoryId,
      name: this.searchQuery,
      minPrice: this.minPrice,
      maxPrice: this.maxPrice,
      color: this.color,
      brandId: this.brandId,
      styleId: this.styleId,
      materialId: this.materialId,
      productStatus: this.productStatus,
      sortBy: this.sortBy,
      isDescending: this.isDescending,
    );

    response.when(
      success: (productResponse) {
        // Filter out any null products just in case
        final newProducts = productResponse.result.whereType<Product>().toList();

        if (newProducts.isEmpty) {
          hasMoreData = false;
        } else {
          productsList.addAll(newProducts);
          currentPage++;
        }

        isLoadingMore = false;
        emit(ProductState.productSuccess(List<Product>.from(productsList)));
      },
      failure: (errorHandler) {
        isLoadingMore = false;
        emit(ProductState.productError(errorHandler));
      },
    );
  }
}
