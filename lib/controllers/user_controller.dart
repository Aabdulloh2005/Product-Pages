import 'package:homework_46/models/user.dart';
import 'package:homework_46/services/user_http.dart';

class UserController {
  List<User> list = [];
  final userHttp = UserHttp();

  Future<List<User>> getUsers() async {
    list = await userHttp.getUsers();

    return list;
  }
}
