import 'package:login/core/data/local/user_dao.dart';
import 'package:login/core/models/user_model.dart';
import 'package:login/core/user_repo.dart';

class UserRepositoryImpl with UserRepository {
  UserDAO _userDAO = UserDAO();
  @override
  Future<void> getUser(String userName, Function result) async {
    _userDAO.getUser(userName).then((value) => result(value));
  }

  @override
  Future<bool> register(UserModel user) async {
    return _userDAO.saveUser(user);
  }
}