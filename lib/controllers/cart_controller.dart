import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:fakestore/models/cart.dart';
import 'package:fakestore/utils/storage_service.dart';

class CartServices {
  //
  static String cartItemsKey = "cart_items";
  static String totalItemKey = "total_cart_items";
  //
  static List<Cart> productsInCart = [];
  final SharedPreferences sharedPreferences;
  CartServices(
    this.sharedPreferences,
  );
  static Future<void> getCartItems() async {
    final cartList = LocalStorageService.prefs!.getString(
      cartItemsKey,
    );

    //
    if (cartList != null) {
      productsInCart = (jsonDecode(cartList) as List).map((cartObject) {
        return Cart.fromJson(cartObject);
      }).toList();
    } else {
      productsInCart = [];
    }
  }

  static clearCart() async {
    await LocalStorageService.prefs!.setString(
      cartItemsKey,
      '',
    );
    // await updateTotalCartItemCount(0);
    productsInCart = [];
  }

  static addToCart(Cart cart) async {
    //
    try {
      final mProductsInCart = productsInCart;
      mProductsInCart.add(cart);
      await LocalStorageService.prefs!.setString(
        cartItemsKey,
        jsonEncode(
          mProductsInCart,
        ),
      );
      //
      productsInCart = mProductsInCart;
      //update total item in cart count
      // await updateTotalCartItemCount(productsInCart.length);
      await getCartItems();
    } catch (error) {
      print("Saving Cart Error => $error");
    }
  }

  static saveCartItems(List<Cart> productsInCart) async {
    await LocalStorageService.prefs!.setString(
      cartItemsKey,
      jsonEncode(
        productsInCart,
      ),
    );

    //update total item in cart count
    // await updateTotalCartItemCount(productsInCart.length);

    await getCartItems();
  }

  // static updateTotalCartItemCount(int total) async {
  //   //update total item in cart count
  //   await LocalStorageService.rxPrefs!.setInt(totalItemKey, total);
  // }

  //
}
