import 'dart:convert';
import 'dart:io';

import 'package:fakestore/models/products.dart';
import 'package:fakestore/utils/constants.dart';
import 'package:fakestore/utils/error_handler.dart';
import 'package:http/http.dart' as http;

class ProductController {
  // ENDPOINT FOR FETCHING ALL PRODUCTS
  Future<List<Product>> fetchAllProducts() async {
    try {
      http.Response response = await http
          .get(Uri.parse('${AppConstants.baseUrl}products'), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      });

      List allproducts = jsonDecode(response.body);

      return allproducts.map((product) => Product.fromJson(product)).toList();
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the data 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}
