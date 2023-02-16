import 'package:fakestore/models/products.dart';
import 'package:fakestore/providers/cart_provider.dart';
import 'package:fakestore/providers/product_provider.dart';
import 'package:fakestore/utils/colors.dart';
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
    return Stack(
      children: [
        Container(
          height: 188,
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
                height: 110, width: double.maxFinite, fit: BoxFit.cover),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                product.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.alternativeColor.withOpacity(0.8)),
            child: Row(children: [
              TextButton.icon(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    context.read<ProductProvider>().addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Added To cart"),
                    ));
                  },
                  label: const Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )),
              Container(height: 20, color: Colors.white, width: 1),
              SizedBox(width: 3),
              Text(
                'Tsh ${product.price.toString()}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
