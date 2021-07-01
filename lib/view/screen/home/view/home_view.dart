import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/constant/style_constant.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Page',
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: _navigateBack,
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)
            ),
          )
        ],
      )
    );
  }

  void _navigateBack() {
    final navigator = Get.find<NavigationPageController>();
    navigator.changeActivePage(PageConstant.LOGIN_PAGE);
  }
}
