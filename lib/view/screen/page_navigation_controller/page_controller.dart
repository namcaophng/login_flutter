import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';
import 'package:login/view/screen/unknown/UnknownViewPage.dart';

class PageControllerView extends StatefulWidget {
  const PageControllerView({Key? key}) : super(key: key);

  @override
  _PageControllerViewState createState() => _PageControllerViewState();
}

class _PageControllerViewState extends State<PageControllerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationPageController>(
        builder: (val) {
          var page = val.pages[val.activePage];
          if (page == null) return UnknownViewPage();
          else return page;
        },
      ),
    );
  }
}
