import 'package:bloc/bloc.dart';
import 'package:waie/features/cart/data/model/add_to_cart_item_request.dart';
import 'package:waie/features/cart/data/model/remove_from_cart_item_request.dart';
import 'package:waie/features/cart/data/repository/cart_repo.dart';
import 'package:waie/features/cart/logic/cart_state.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  List<Product> _cartItems = []; // Private list to store current cart items

  CartCubit(this._cartRepo) : super(const CartState.initial());

  // Add an item to the cart
  Future<void> addItemToCart(AddToCartItemRequest request) async {
    // Check if the item already exists in the cart
    if (_cartItems.any((item) => item.productId == request.productId)) {
      emit(const CartState.error(error: "Item is already in the cart."));
      fetchCartItems();
      return;
    }

    emit(const CartState.loading());

    final response = await _cartRepo.addItemToCart(request);

    response.when(
      success: (addToCartItemResponse) {
        if (addToCartItemResponse.isSuccess) {
          emit(CartState.itemAdded(addToCartItemResponse));
          fetchCartItems(); // Refresh cart items after adding
        } else {
          emit(CartState.error(
              error: addToCartItemResponse.message ?? "Failed to add item to cart"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }

  // Remove an item from the cart
  Future<void> removeItemFromCart(RemoveFromCartItemRequest request) async {
    emit(const CartState.loading());

    final response = await _cartRepo.removeItemFromCart(request);

    response.when(
      success: (removeFromCartItemResponse) {
        if (removeFromCartItemResponse.isSuccess) {
          emit(CartState.itemRemoved(removeFromCartItemResponse));
          fetchCartItems(); // Refresh cart items after removing
        } else {
          emit(CartState.error(
              error: removeFromCartItemResponse.message ?? "Failed to remove item from cart"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }

  // Fetch cart items
  Future<void> fetchCartItems() async {
    emit(const CartState.loading());

    final response = await _cartRepo.getCartItems();

    response.when(
      success: (getCartItems) {
        if (getCartItems.isSuccess == true) {
          _cartItems = getCartItems.result ?? []; // Update the internal list
          emit(CartState.cartItemsFetched(getCartItems));
        } else {
          emit(CartState.error(
              error: getCartItems.message ?? "Failed to fetch cart items"));
        }
      },
      failure: (error) {
        emit(CartState.error(
            error: error.apiErrorModel.message ?? "An error occurred"));
      },
    );
  }


  // Get current cart items
  List<Product> get currentCartItems => _cartItems;
}
