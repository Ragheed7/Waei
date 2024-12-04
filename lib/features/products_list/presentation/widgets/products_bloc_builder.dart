import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/logic/cubit/product_cubit.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';
import 'package:waie/features/products_list/presentation/widgets/products_list_view.dart';
import 'package:waie/features/search/presentation/widgets/products_grid_view.dart';

import '../../data/model/product_models/product.dart'; 

class ProductsBlocBuilder extends StatelessWidget {
  final CategoryData? categoryData;
  final bool grid; 

  const ProductsBlocBuilder({
    Key? key,
    this.categoryData,
    required this.grid, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<ProductCubit>().getProducts(
                  isInitialLoad: true,
                  categoryId: categoryData?.categoryId,
                );
            return setupLoading([]);
          },
          productLoading: (products) {
            return setupLoading(products);
          },
          productSuccess: (products) {
            return setupSuccess(products);
          },
          productError: (errorHandler) {
            return setupError();
          },
        );
      },
    );
  }

  Widget setupLoading(List<Product?>? list) {
    final products = list?.whereType<Product>().toList() ?? [];

    return Stack(
      children: [
        grid
            ? ProductsGridView(
                products: products,
                categoryData: categoryData,
              )
            : ProductsListView(
                products: products,
                categoryData: categoryData,
              ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Center(
            child: CircularProgressIndicator(color: ColorsManager.mainGreen),
          ),
        ),
      ],
    );
  }

  Widget setupSuccess(List<Product?>? list) {
    final products = list?.whereType<Product>().toList() ?? [];

    if (products.isEmpty) {
      return Center(
        child: Text(
          categoryData == null
              ? "No products available."
              : "No products available for ${categoryData!.nameEn}.",
        ),
      );
    }

    return grid
        ? ProductsGridView(
            products: products,
            categoryData: categoryData,
          )
        : ProductsListView(
            products: products,
            categoryData: categoryData,
          );
  }

  Widget setupError() {
    return Center(
      child: Text("An error occurred"),
    );
  }
}
