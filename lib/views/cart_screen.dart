import 'package:auto_animated/auto_animated.dart';
import 'package:fakestore/models/cart.dart';
import 'package:fakestore/providers/cart_provider.dart';
import 'package:fakestore/views/widgets/cart_container.dart';
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
    final options = LiveOptions(
      showItemInterval: const Duration(milliseconds: 55),
      visibleFraction: 0.05,
      reAnimateOnVisibility: false,
    );

    Widget buildAnimatedItem(
      BuildContext context,
      int index,
      Animation<double> animation,
    ) {
      Cart? cart = carts[index];
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.2, 0),
              end: Offset.zero,
            ).animate(animation),
            child: CartContainer(
                ondelete: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Delete product',
                        style: TextStyle(fontSize: 14),
                      ),
                      content: Text(
                        'Do you really want to delete this product?',
                        style: TextStyle(fontSize: 14),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cartProvider.deleteCartItem(index);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'REMOVE',
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                cart: cart)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Cart Screen")),
      bottomSheet: Container(
        height: 60,
        color: Colors.grey.shade400,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Total Price:",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(width: 10),
          Text(
            cartProvider.totalCartPrice.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
        ]),
      ),
      body: cartProvider.loading
          ? SizedBox(
              child: Center(child: CircularProgressIndicator()),
            )
          : cartProvider.cartItems.length == 0
              ? Center(
                  child: Text("No Items"),
                )
              : LiveList.options(
                  options: options,
                  itemCount: carts.length,
                  shrinkWrap: true,
                  itemBuilder: buildAnimatedItem),
    );
  }
}
