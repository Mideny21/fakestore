import 'package:fakestore/controllers/cart_controller.dart';
import 'package:fakestore/models/cart.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  //
  List<Cart> cartItems = [];
  int totalCartItems = 0;
  bool loading = false;
  double subTotalPrice = 0.0;
  double discountCartPrice = 0.0;
  double totalCartPrice = 0.0;

  CartProvider() {
    initialise();
  }

  void initialise() async {
    loading = true;
    notifyListeners();
    try {
      cartItems = CartServices.productsInCart;
      calculateSubTotal();
      loading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      loading = false;

      notifyListeners();
    }
  }

  calculateSubTotal() {
    totalCartItems = 0;
    subTotalPrice = 0;

    //
    cartItems.forEach(
      (cartItem) {
        totalCartItems += cartItem.selectedQty!;
        final totalProductPrice = cartItem.price! * cartItem.selectedQty!;
        subTotalPrice += totalProductPrice;
      },
    );

    //
    totalCartPrice = subTotalPrice;
    notifyListeners();
  }

  deleteCartItem(int index) async {
    //remove item/product from cart
    cartItems.removeAt(index);
    await CartServices.saveCartItems(cartItems);
    initialise();
  }

  //
  updateCartItemQuantity(int qty, int index) async {
    cartItems[index].selectedQty = qty;
    await CartServices.saveCartItems(cartItems);
    initialise();
  }
}
