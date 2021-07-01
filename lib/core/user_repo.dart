import 'package:login/core/models/user_model.dart';

abstract class UserRepository {
  Future<void> getUser(String userName, Function result);

  Future<bool> register(UserModel user);
}