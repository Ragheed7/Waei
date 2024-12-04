import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/shared_models/look_ups/logic/lookup_cubit.dart';
import 'package:waie/features/home/presentation/widgets/home_app_bar.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/presentation/widgets/products_bloc_builder.dart';
import 'package:waie/features/search/presentation/widgets/filter_oprtions.dart';
import 'package:waie/features/search/presentation/widgets/search_app_bar.dart';

class SearchScreen extends StatefulWidget {
  final CategoryData? categoryData;

  const SearchScreen({Key? key, this.categoryData}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ProductCubit _productCubit;
  String _currentSearchQuery = '';
  Map<String, dynamic> _currentFilters = {};

  @override
  void initState() {
    super.initState();
    _productCubit = getIt<ProductCubit>();
    _productCubit.getProducts(
      isInitialLoad: true,
      categoryId: widget.categoryData?.categoryId,
    );
  }

  void _onSearchChanged(String searchText) {
    setState(() {
      _currentSearchQuery = searchText;
    });
    _productCubit.getProducts(
      isInitialLoad: true,
      categoryId:
          _currentFilters['categoryId'] ?? widget.categoryData?.categoryId,
      searchQuery: searchText,
      minPrice: _currentFilters['minPrice'],
      maxPrice: _currentFilters['maxPrice'],
      color: _currentFilters['color'],
      brandId: _currentFilters['brandId'],
      styleId: _currentFilters['styleId'],
      materialId: _currentFilters['materialId'],
      productStatus: _currentFilters['productStatus'],
      sortBy: _currentFilters['sortBy'],
      isDescending: _currentFilters['isDescending'],
    );
  }

  void _onApplyFilters(Map<String, dynamic> filters) {
    setState(() {
      _currentFilters = filters;
    });
    _productCubit.getProducts(
      isInitialLoad: true,
      categoryId: filters['categoryId'] ?? widget.categoryData?.categoryId,
      searchQuery: _currentSearchQuery,
      minPrice: filters['minPrice'],
      maxPrice: filters['maxPrice'],
      color: filters['color'],
      brandId: filters['brandId'],
      styleId: filters['styleId'],
      materialId: filters['materialId'],
      productStatus: filters['productStatus'],
      sortBy: filters['sortBy'],
      isDescending: filters['isDescending'],
    );
  }

void _showFilterOptions() {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocProvider(
        create: (context) => getIt<LookupCubit>()..fetchLookups(),
        child: FilterOptions(
          onApplyFilters: _onApplyFilters,
          initialMinPrice: _currentFilters['minPrice'],
          initialMaxPrice: _currentFilters['maxPrice'],
          initialSelectedCategory: _currentFilters['categoryId'] ?? widget.categoryData?.categoryId,
          initialSelectedColor: _currentFilters['color'],
          initialSelectedBrand: _currentFilters['brandId'],
          initialSelectedStyle: _currentFilters['styleId'],
          initialSelectedMaterial: _currentFilters['materialId'],
          initialProductStatus: _currentFilters['productStatus'],
          initialSortBy: _currentFilters['sortBy'],
          initialIsDescending: _currentFilters['isDescending'],
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productCubit,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: HomeAppBar(),
                ),
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          pinned: true,
                          backgroundColor: Colors.white,
                          title: SearchAppBar(
                            onSearchChanged: _onSearchChanged,
                            onFilterPressed: _showFilterOptions,
                          ),
                        ),
                      ];
                    },
                    body: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: ProductsBlocBuilder(
                        categoryData: widget.categoryData,
                        grid: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
