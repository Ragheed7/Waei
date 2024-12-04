import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/product_screen/presentation/widgets/add_to_cart_button.dart';
import 'package:waie/features/product_screen/presentation/widgets/images_slider.dart';
import 'package:waie/features/product_screen/presentation/widgets/product_description.dart';
import 'package:waie/features/product_screen/presentation/widgets/title_category_and_price.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nameEn ?? "Product Overview"),
        leading: BackButton(),
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // product images
                ImagesSlider(product: widget.product),
                verticalSpace(20),
                // Product Details
                TitleCategoryAndPrice(product: widget.product),
                verticalSpace(10),
                // Product Description
                ProductDescription(product: widget.product),
                verticalSpace(30),
                // add to cart button
                AddToCartButton(product: widget.product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
