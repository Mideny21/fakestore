import 'package:fakestore/controllers/cart_controller.dart';
import 'package:fakestore/controllers/product_controller.dart';
import 'package:fakestore/models/cart.dart';
import 'package:fakestore/models/products.dart';
import 'package:fakestore/utils/error_handler.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  // ALL PRODUCTS AND TRACKING PAGES
  List<Product> _products = [];
  List<Product> get products => _products;

  bool loading = false;
  String status = '';
  double subTotal = 0.0;
  double total = 0.0;
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
      loading = false;
      notifyListeners();
    } on Failure catch (e) {
      loading = false;
      status = e.toString();
      notifyListeners();
    }
  }

  addToCart(Product product) async {
    final cart = Cart();
    cart.price = product.price;
    cart.productId = product.id;
    cart.title = product.title;
    cart.image = product.image;
    cart.selectedQty = 1;

    try {
      await CartServices.addToCart(cart);
      print(cart.productId);
    } catch (error) {
      print("Cart Error => $error");
    }
  }
}
