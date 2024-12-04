import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/networking/api_constants.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';
import 'package:waie/features/cart/logic/cart_cubit.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/core/theming/colors.dart';

class CartItemScreen extends StatelessWidget {
  final Product product;
  final bool showDeleteButton; 

  const CartItemScreen({
    Key? key,
    required this.product,
    this.showDeleteButton = true, 
  }) : super(key: key);

  /// Helper method to construct the full image URL
  String getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return 'assets/images/default_product.png';
    }
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      return imageUrl; 
    }
    
    return ApiConsts.serverBaseUrl + imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    // Extract necessary product details
    final fullImageUrl = product.images != null && product.images!.isNotEmpty
        ? getFullImageUrl(product.images!.first.imageUrl)
        : 'assets/images/Bedrooms.jpg';

    final name = product.nameEn ?? 'Unnamed Product';
    final price = product.price ?? 0.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          fullImageUrl.startsWith('assets/')
              ? Image.asset(
                  fullImageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  fullImageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/Bedrooms.jpg',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    );
                  },
                ),
          SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "SAR ${price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorsManager.mainGreen,
                  ),
                ),
              ],
            ),
          ),
          // Conditionally Display Remove Button
          if (showDeleteButton)
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Confirm Deletion with the User
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text("Remove Item"),
                    content: Text("Are you sure you want to remove this item from the cart?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), // Cancel
                        child: Text("Cancel", style: TextStyle(color: Colors.black),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          // Dispatch removeItemFromCart event
                          final request =
                              RemoveFromCartItemRequest(productId: product.productId!);
                          context.read<CartCubit>().removeItemFromCart(request);
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
