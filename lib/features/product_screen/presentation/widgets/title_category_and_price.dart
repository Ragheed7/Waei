import 'package:flutter/material.dart';

import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class TitleCategoryAndPrice extends StatefulWidget {
  final Product product;

  const TitleCategoryAndPrice({super.key, required this.product});

  @override
  State<TitleCategoryAndPrice> createState() => _TitleCategoryAndPriceState();
}

class _TitleCategoryAndPriceState extends State<TitleCategoryAndPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.product.nameEn ?? "Product's Name",
            style: TextStyle(
              color: ColorsManager.mainBlack,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.product.category?.nameEn ?? "Product's Category",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Product Price
            Text(
              "\SAR ${widget.product.price ?? "0"}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsManager.mainGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
