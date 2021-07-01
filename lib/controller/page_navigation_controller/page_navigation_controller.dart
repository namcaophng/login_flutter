import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/view/screen/home/view/home_view.dart';
import 'package:login/view/screen/login/view/login_view.dart';
import 'package:login/view/screen/register/view/register_view.dart';
import 'package:login/view/screen/unknown/UnknownViewPage.dart';

class NavigationPageController extends GetxController {
  final pages = [
    LoginViewPage(),
    HomeViewPage(),
    RegisterViewPage(),
    UnknownViewPage()
  ];

  var activePage = 0;

  changeActivePage(int page) {
    activePage = page;
    update();
  }
}