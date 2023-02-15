import 'package:fakestore/models/products.dart';
import 'package:fakestore/providers/product_provider.dart';
import 'package:fakestore/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future _getAllproducts() async {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.fetchProducts();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _getAllproducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<Product>? products = productProvider.products;
    return productProvider.loading
        ? SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
        : GridView.builder(
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 800,
            ),
            itemBuilder: (BuildContext context, int index) {
              Product? product = products[index];

              return ProductCard(product: product);
            });
  }
}
