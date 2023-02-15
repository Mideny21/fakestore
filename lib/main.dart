import 'package:fakestore/providers/cart_provider.dart';
import 'package:fakestore/providers/product_provider.dart';
import 'package:fakestore/utils/themes.dart';
import 'package:fakestore/views/home_screen.dart';
import 'package:fakestore/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fake Store',
          theme: lightThemeData,
          home: const MainScreen()),
    );
  }
}
