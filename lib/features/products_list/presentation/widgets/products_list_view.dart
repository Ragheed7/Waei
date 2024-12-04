import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/features/product_screen/presentation/ProductScreen.dart';
import '../../logic/cubit/product_cubit.dart';

class ProductsListView extends StatefulWidget {
  final List<Product> products;
  final CategoryData? categoryData;

  ProductsListView({
    Key? key,
    required this.products,
    required this.categoryData,
  }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add scroll listener
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // Dispose the controller
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Check if we are at the bottom of the list
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      // Request more products
      context.read<ProductCubit>().getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    return ListView.builder(
      controller: _scrollController,
      // physics: NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      itemCount: widget.products.length + 1, // Add 1 for the loading indicator
      itemBuilder: (context, index) {
        if (index < widget.products.length) {
          final product = widget.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(product: product),
                ),
              );
            },
            child: ProductItem(
              product: product,
              categoryData: widget.categoryData,
              isGrid: false,
            ),
          );
        } else {
          // Show loading indicator at the end
          return _buildLoadingIndicator(productCubit);
        }
      },
    );
  }

  Widget _buildLoadingIndicator(ProductCubit productCubit) {
    if (productCubit.hasMoreData && productCubit.isLoadingMore) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircularProgressIndicator(color: ColorsManager.mainGreen,),
        ),
      );
    } else if (!productCubit.hasMoreData) {
      // No more data to load
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('No more products'),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
