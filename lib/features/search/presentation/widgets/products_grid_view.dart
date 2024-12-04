import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item.dart';
import 'package:waie/features/product_screen/presentation/ProductScreen.dart';

class ProductsGridView extends StatefulWidget {
  final CategoryData? categoryData;

  ProductsGridView({Key? key, required this.categoryData, required List<Product> products}) : super(key: key);

  @override
  State<ProductsGridView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsGridView> {
  final ScrollController _scrollController = ScrollController();
  late ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _productCubit = context.read<ProductCubit>();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _productCubit.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        List<Product> products = [];
        if (state is ProductSuccess) {
          products = state.products;
        } else if (state is ProductLoading) {
          products = state.products;
        } else if (state is ProductError) {
          return Center(
            child: Text('Error: ${state.errorHandler.apiErrorModel.message}'),
          );
        }

        if (products.isEmpty) {
          return Center(child: Text('No products found'));
        }

        return GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.6,
          ),
          itemCount: products.length + 1,
          itemBuilder: (context, index) {
            if (index < products.length) {
              final product = products[index];
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
                  isGrid: true,
                ),
              );
            } else {
              return _buildLoadingIndicator(_productCubit);
            }
          },
        );
      },
    );
  }

  Widget _buildLoadingIndicator(ProductCubit productCubit) {
    if (productCubit.hasMoreData && productCubit.isLoadingMore) {
      return Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainGreen,
        ),
      );
    } else if (!productCubit.hasMoreData) {
      return Center(
        child: Text('No more products'),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
