import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/view/screen/page_navigation_controller/page_controller.dart';
import 'package:login/viewmodel/sudoku_viewmodel.dart';
import 'package:login/viewmodel/user_viewmodel.dart';
import 'controller/page_navigation_controller/page_navigation_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final userController = Get.put(UserViewModel());
  final pageNavigateController = Get.put(NavigationPageController());
  final sudokuController = Get.put(SudokuViewModel());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login DEMO',
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: PageControllerView(),
    );
  }
}
