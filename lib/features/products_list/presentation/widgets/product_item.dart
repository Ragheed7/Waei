import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/presentation/widgets/product_image.dart';
import 'package:waie/features/products_list/presentation/widgets/product_item_details.dart';

import '../../data/model/product_models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final CategoryData? categoryData;
  final bool isGrid;

  ProductItem({
    Key? key,
    required this.product,
    required this.categoryData,
    required this.isGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      // When isGrid is true, display only the image
      return Container(
        margin: EdgeInsets.only(bottom: 15),
        child: ProductImage(
          categoryData: categoryData,
          product: product,
        ),
      );
    } else {
      // When isGrid is false, display the full item with image and details
      return Container(
        height: 120,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side (image)
            ProductImage(
              categoryData: categoryData,
              product: product,
            ),
            // Right side (details)
            ProductItemDetails(product: product),
          ],
        ),
      );
    }
  }
}
