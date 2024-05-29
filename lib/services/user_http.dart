import 'dart:convert';

import 'package:homework_46/models/user.dart';
import 'package:http/http.dart' as http;

class UserHttp {
  Future<List<User>> getUsers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");

    final response = await http.get(url);
    final data = jsonDecode(response.body).cast<Map<String, dynamic>>();

    List<User> loadedusers = [];
    for (var product in data) {
      loadedusers.add(User.fromJson(product));
    }
    return loadedusers;
  }
}
