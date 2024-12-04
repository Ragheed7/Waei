import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/cart/logic/cart_cubit.dart';
import 'package:waie/features/cart/logic/cart_state.dart';
import 'package:waie/features/cart/presentation/widgets/cart_item_screen.dart';
import 'package:waie/features/cart/presentation/widgets/cart_summary_screen.dart';
import 'package:waie/features/cart/presentation/widgets/checkout_button_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch cart items when the screen is initialized
    context.read<CartCubit>().fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: 'Cart'),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // Listen for error states to show SnackBars or other notifications
          state.maybeWhen(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
            itemAdded: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item added to cart successfully")),
              );
            },
            itemRemoved: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item removed from cart")),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text("Initializing Cart...")),
            loading: () => Center(child: CircularProgressIndicator()),
            cartItemsFetched: (data) {
              final cartItems = data.result ?? [];
              if (cartItems.isEmpty) {
                return Center(
                    child: Image.asset(
                  "assets/images/EmptyCart.png",
                  width: 150,
                  height: 200,
                ));
              }

              // Calculate total
              double total = 0;
              for (var item in cartItems) {
                if (item?.price != null) {
                  total += item!.price!;
                }
              }

              return SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CartSummaryScreen(
                          itemCount: cartItems.length,
                          totalPrice: total,
                        ),
                        SizedBox(height: 15),
                        ListView.builder(
                          itemCount: cartItems.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product = cartItems[index];
                            return CartItemScreen(
                              product: product,
                              showDeleteButton: true,
                            );
                          },
                        ),
                        SizedBox(height: 100),
                        CheckoutButtonScreen(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error) => Center(child: Text(error)),
            itemAdded: (_) => Container(),
            itemRemoved: (_) => Container(),
            success: (_) => Container(),
          );
        },
      ),
    );
  }
}
