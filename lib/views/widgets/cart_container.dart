import 'package:flutter/material.dart';

import 'package:fakestore/models/cart.dart';

class CartContainer extends StatelessWidget {
  final Cart cart;
  final VoidCallback ondelete;

  const CartContainer({
    Key? key,
    required this.cart,
    required this.ondelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0) // changes position of shadow
                ),
          ],
        ),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Image.network(cart.image!,
                height: 100, width: double.maxFinite, fit: BoxFit.cover),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.title!,
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Text(
                  'Tsh ${cart.price!.toString()}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: ondelete,
                  icon: Icon(Icons.delete, color: Colors.red)))
        ]),
      ),
    );
  }
}
