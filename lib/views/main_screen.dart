import 'package:fakestore/providers/cart_provider.dart';
import 'package:fakestore/views/cart_screen.dart';
import 'package:fakestore/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              icon: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -15, end: -8),
                badgeContent: Consumer<CartProvider>(
                  builder: ((context, value, child) {
                    return Text(
                      value.totalItems.toString(),
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: ListView(children: [HomeView()]),
      ),
    );
  }
}
