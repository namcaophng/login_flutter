import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';

class PageControllerView extends StatefulWidget {
  @override
  _PageControllerViewState createState() => _PageControllerViewState();
}

class _PageControllerViewState extends State<PageControllerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationPageController>(
        builder: (val) {
          if (val.activePage.isNullOrBlank == true) {
            val.activePage = PageConstant.LOGIN_PAGE;
            return val.pages[val.activePage]!;
          } else if (!PageConstant.all.contains(val.activePage)) {
            val.activePage = PageConstant.UNKNOWN_PAGE;
            return val.pages[val.activePage]!;
          }
          return val.pages[val.activePage]!;
        },
      ),
    );
  }
}
