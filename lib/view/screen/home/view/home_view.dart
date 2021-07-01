import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
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
        children: [
          Text(
            'Home Page',
          ),
          TextButton(
            onPressed: _navigateBack,
            child: Text("Back"),
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
