import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/category_data_model/category_data.dart';
import 'package:waie/features/home/presentation/widgets/category_item.dart';

class CategoriesGridView extends StatefulWidget {
  final List<CategoryData?> categories;
  const CategoriesGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  var selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.categories.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final category = widget.categories[index];
        if (category == null) {
          return const SizedBox.shrink();
        };
        return GestureDetector(
          onTap: () {
          },
          child: CategoryItem(
              categoryData: category),
        );
      },
    );
  }
}
