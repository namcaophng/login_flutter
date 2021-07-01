import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';
import 'package:login/core/models/user_model.dart';
import 'package:login/core/user_repo.dart';
import 'package:login/core/user_repo_impl.dart';
import 'package:login/view/screen/home/view/home_view.dart';
import 'package:login/view/screen/login/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserEnums { Logged, Logout, Waiting, Error, Initial }

class UserViewModel extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late SharedPreferences _sharedPrf;
  UserRepository _userRepository = UserRepositoryImpl();

  UserEnums userEnums = UserEnums.Initial;

  late String name;
  late String email;
  late String password;

  late UserModel user;

  addKeyToSharedPref(String key, String value) async {
    _sharedPrf = await SharedPreferences.getInstance();
    _sharedPrf.setString(key, value);
  }

  void login(email, password, {Function? func}) {

    print(email);
    userEnums = UserEnums.Waiting;
    update();
    _userRepository.getUser(email, (UserModel? result) {
      if (result == null) {
        userEnums = UserEnums.Error;
        debugPrint('There was a problem with user login....');
      } else {
        if ((result).password == password) {
          user = result;
          addKeyToSharedPref(SHAPREF_ACCOUNT, user.account);
          update();
          final navigator = Get.find<NavigationPageController>();
          print("login success");
          navigator.changeActivePage(PageConstant.HOME_PAGE);
        } else {
          userEnums = UserEnums.Error;
          debugPrint('Wrong password...');
          func?.call("Wrong password");
        }
      }
    });
  }

  void register(name, email, password) {
    print(name);
    print(email);
    print(password);

    userEnums = UserEnums.Waiting;
    update();

    _userRepository.getUser(email, (UserModel? result) {
      if (result != null) {
        userEnums = UserEnums.Error;
        debugPrint('Email was existed...');
      } else {
        _userRepository.register(
            UserModel(name: name, account: email, password: password)
        );
        print("register success");
        addKeyToSharedPref(SHAPREF_ACCOUNT, email);
        update();
        final navigator = Get.find<NavigationPageController>();
        navigator.changeActivePage(PageConstant.LOGIN_PAGE);
      }
    });
  }

  final String SHAPREF_ACCOUNT = 'share_pref_account';
}
