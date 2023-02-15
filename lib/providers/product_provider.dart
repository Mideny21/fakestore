import 'package:fakestore/controllers/product_controller.dart';
import 'package:fakestore/models/products.dart';
import 'package:fakestore/utils/error_handler.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  // ALL PRODUCTS AND TRACKING PAGES
  List<Product> _products = [];
  List<Product> get products => _products;

  bool loading = false;
  String status = '';
  late ProductController productController;

  ProductProvider() {
    productController = ProductController();
  }

  // FETCHING ALL PRODUCTS
  Future fetchProducts() async {
    loading = true;
    notifyListeners();
    try {
      _products = await productController.fetchAllProducts();
      print(_products);
      loading = false;
      notifyListeners();
    } on Failure catch (e) {
      loading = false;
      status = e.toString();
      notifyListeners();
    }
  }
}
