import 'dart:convert';

import 'package:homework_46/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryHttp {
  Future<List<Category>> getCategories() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

    final response = await http.get(url);
    final data = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<Category> loadcategories = [];
    for (var product in data) {
      loadcategories.add(Category.fromJson(product));
    }
    return loadcategories;
  }
}
