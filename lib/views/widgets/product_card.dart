import 'package:fakestore/models/products.dart';
import 'package:fakestore/providers/cart_provider.dart';
import 'package:fakestore/providers/product_provider.dart';
import 'package:fakestore/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(children: [
        Image.network(product.image,
            height: 95, width: double.maxFinite, fit: BoxFit.cover),
        Text(
          product.title,
          overflow: TextOverflow.ellipsis,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            TextButton(
                onPressed: () {
                  context.read<ProductProvider>().addToCart(product);
                  // toastinfo(msg: "Added to cart");
                },
                child: const Text("Add to cart")),
            Container(
              height: 10,
              color: Colors.white,
              width: 8,
            ),
            Text(product.price.toString()),
          ]),
        )
      ]),
    );
  }
}
