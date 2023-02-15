import 'package:fakestore/models/cart.dart';
import 'package:fakestore/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future _getCartItems() async {
    final provider = Provider.of<CartProvider>(context, listen: false);
    provider.initialise();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _getCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<Cart>? carts = cartProvider.cartItems;
    return Scaffold(
      body: cartProvider.loading
          ? SizedBox(
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView.builder(
              itemCount: carts.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Cart? cart = carts[index];

                return ListTile(
                  title: Text(cart.title!),
                  leading: Text(cartProvider.totalCartPrice.toString()),
                );
              }),
    );
  }
}
