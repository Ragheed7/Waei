import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

import '../../data/model/product_models/product.dart';

class ProductItemDetails extends StatelessWidget {
  final Product product;

  ProductItemDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              product.nameEn ?? "Product Name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            // Description
            Text(
              "${product.descriptionEn ?? "Product Description"}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            // Price
            Text(
              "\SAR ${product.price ?? "0"}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
