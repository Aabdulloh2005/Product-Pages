import 'dart:convert';

// import 'package:homework_46/models/product.dart';
import 'package:homework_46/models/product.dart';
import 'package:http/http.dart' as http;

class ProductHttp {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    final response = await http.get(url);
    final data = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<Product> loadedProduct = [];
    for (var product in data) {
      loadedProduct.add(Product.fromJson(product));
    }
    return loadedProduct;
  }
}
