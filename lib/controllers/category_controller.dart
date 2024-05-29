import 'package:homework_46/models/category.dart';
import 'package:homework_46/services/category_http.dart';

class CategoryController {
  List<Category> list = [];
  final userHttp = CategoryHttp();

  Future<List<Category>> getCategories() async {
    list = await userHttp.getCategories();

    return list;
  }
}
