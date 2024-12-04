import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

import '../../data/model/product_models/product.dart';

class ProductImage extends StatelessWidget {
  final CategoryData? categoryData;
  final Product? product;

  ProductImage({
    Key? key,
    required this.categoryData,
    this.product,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    String imageUrl;

    if (product?.images?.isNotEmpty == true && product!.images![0].imageUrl != null) {
      imageUrl = ApiConsts.serverBaseUrl + product!.images![0].imageUrl!;
    } else {
      imageUrl = "assets/images/LivingRooms.jpg";
    }

    return SizedBox(
      height: 120,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: imageUrl.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                fit: BoxFit.cover,
                height: 120,
                placeholder: (context, url) => CircularProgressIndicator(color: ColorsManager.mainGreen,),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/LivingRooms.jpg",
                  width: 120,
                  fit: BoxFit.cover,
                  height: 120,
                ),
              )
            : Image.asset(
                imageUrl,
                width: 120,
                fit: BoxFit.cover,
                height: 120,
              ),
      ),
    );
  }
}
