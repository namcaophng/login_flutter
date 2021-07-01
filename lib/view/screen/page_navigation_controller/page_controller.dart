import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        builder: (val) => val.pages.elementAt(val.activePage),
      ),
    );
  }
}
