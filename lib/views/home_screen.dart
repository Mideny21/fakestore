import 'package:fakestore/models/products.dart';
import 'package:fakestore/providers/product_provider.dart';
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
    return Scaffold(
      body: Center(),
    );
  }
}
