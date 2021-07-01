import 'package:get/get.dart';
import 'package:login/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserEnums { Logged, Logout, Waiting, Error, Initial }

class UserViewModel extends GetxController {
  late SharedPreferences _sharedPrf;

  UserEnums userEnums = UserEnums.Initial;

  String name;
  String email;
  String password;

  UserModel user;

  addKeyToSharedPref(String key, String value) async {
    _sharedPrf = await SharedPreferences.getInstance();
    _sharedPrf.setString(key, value);
  }
}
