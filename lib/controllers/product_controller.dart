import 'package:homework_46/models/product.dart';
import 'package:homework_46/services/product_http.dart';

class ProductController {
  List<Product> list = [];
  final productHttp = ProductHttp();

  Future<List<Product>> getProducts() async {
    list = await productHttp.getProducts();

    return list;
  }
}
