import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/products_list/presentation/products_list_screen.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryItem({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = categoryData.imageUrl != null
        ? ApiConsts.serverBaseUrl + categoryData.imageUrl!
        : 'assets/images/waie2.png';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductsListScreen(categoryData: categoryData),
          ),
        );
      },
      child: Container(
        width: 180, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: Image.network(imageUrl, fit: BoxFit.cover, height: 120, width: 180,)
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 180,
                height: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 180,
                  height: 120,
                  color: Colors.grey.shade200,
                  child: Icon(Icons.image, color: Colors.grey.shade400),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/waie2.png',
                  width: 180,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Category Name
            Align(
              alignment: Alignment.center,
              child: Text(
                categoryData.nameEn ?? "Category Name",
                maxLines: 1,
                overflow: TextOverflow.ellipsis, 
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
