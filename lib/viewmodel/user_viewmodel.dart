import 'package:get/get.dart';
import 'package:login/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserEnums { Logged, Logout, Waiting, Error, Initial }

class UserViewModel extends GetxController {
  late SharedPreferences _sharedPrf;

  UserEnums userEnums = UserEnums.Initial;

  late String name;
  late String email;
  late String password;

  late UserModel user;

  addKeyToSharedPref(String key, String value) async {
    _sharedPrf = await SharedPreferences.getInstance();
    _sharedPrf.setString(key, value);
  }

  void login(apiEmail, apiPassword) {
    print(apiEmail);
    userEnums = UserEnums.Waiting;
    update();
    _apiServices.login(apiEmail, apiPassword).then((value) {
      if (value == false) {
        userEnums = UserEnums.Error;
        debugPrint('There was a problem with user login....');
      } else {
        user = UserModel.fromJson(value);
        addKeyToShareedPref('userId', user.objectId);
        update();
        Get.offAll(
                () => HomeViewPage()); // it's delete all pages at navigate stack
      }
    });
  }

  void register(apiName, apiEmail, apiPassword) {
    print(apiName);
    print(apiEmail);
    print(apiPassword);

    userEnums = UserEnums.Waiting;
    update();
    _apiServices.register(apiName, apiEmail, apiPassword).then((value) {
      if (value == false) {
        userEnums = UserEnums.Error;

        debugPrint('There was a problem with user register....');
      } else {
        user = UserModel.fromJson(value);
        addKeyToShareedPref('userId', user.objectId);
        update();
        Get.offAll(() => HomeViewPage());
      }
    });
  }
}
