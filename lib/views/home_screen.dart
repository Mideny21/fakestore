import 'package:auto_animated/auto_animated.dart';
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

    // ANIMATION IMPLEMENTATIONS
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
      Product? product = products[index];
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
            child: ProductCard(product: product)),
      );
    }

    return productProvider.loading
        ? SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
        : LiveGrid.options(
            options: options,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.height / 800,
            ),
            itemBuilder: buildAnimatedItem);
  }
}
