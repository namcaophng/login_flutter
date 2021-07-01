import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/view/screen/home/view/home_view.dart';
import 'package:login/view/screen/login/view/login_view.dart';
import 'package:login/view/screen/register/view/register_view.dart';
import 'package:login/view/screen/unknown/UnknownViewPage.dart';

class NavigationPageController extends GetxController {
  final pages = {
    PageConstant.LOGIN_PAGE: LoginViewPage(),
    PageConstant.HOME_PAGE: HomeViewPage(),
    PageConstant.REGISTER_PAGE: RegisterViewPage(),
    PageConstant.UNKNOWN_PAGE: UnknownViewPage()
  };

  var activePage = "";

  changeActivePage(String page) {
    activePage = page;
    update();
  }
}