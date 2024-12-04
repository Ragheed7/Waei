import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/cart/data/model/add_to_cart_item_request.dart';
import 'package:waie/features/cart/logic/cart_cubit.dart';
import 'package:waie/features/cart/logic/cart_state.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/model/product_response.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        state.whenOrNull(
          itemAdded: (data) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text("Item added to cart successfully")),
            // );
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
        );
      },
      builder: (context, state) {
        bool isLoading = false;

        state.whenOrNull(
          loading: () {
            isLoading = true;
          },
        );

        return Container(
          height: 54,
          width: 259,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    final request =
                        AddToCartItemRequest(productId: product.productId!);
                    context.read<CartCubit>().addItemToCart(request);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.mainGreen,
              padding: EdgeInsets.symmetric(horizontal: 54, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cabin',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 22,
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
