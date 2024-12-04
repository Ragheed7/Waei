import 'package:flutter/material.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';
import 'package:waie/features/cart/presentation/widgets/cart_item_screen.dart';

class CartSectionScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartSectionScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItems.map((product) => CartItemScreen(product: product, showDeleteButton: true,)).toList(),
    );
  }
}
