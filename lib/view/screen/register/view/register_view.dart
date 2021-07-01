import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login/constant/page_constant.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';
import 'package:login/view/screen/login/widget/page_title_widget.dart';
import 'package:login/view/screen/register/widget/register_button_widget.dart';
import 'package:login/viewmodel/user_viewmodel.dart';
import 'package:login/widgets/textfield_login_widget.dart';
import 'package:login/widgets/textstyle_generator.dart';

class RegisterViewPage extends StatefulWidget {
  @override
  _RegisterViewPageState createState() => _RegisterViewPageState();
}

class _RegisterViewPageState extends State<RegisterViewPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 244, 255, 1),
      body: Container(
        child: GetBuilder<UserViewModel>(
          builder: (userViewModel) => SingleChildScrollView(
            child: Form(
              key: userViewModel.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .2,
                  ),
                  PageTitleWidget(
                    size: size,
                    text: 'Register',
                  ),
                  FormTextFieldWidget(
                    hint: 'Name',
                    size: size,
                    isPassword: false,
                  ),
                  FormTextFieldWidget(
                    hint: 'Email',
                    size: size,
                    isPassword: false,
                  ),
                  FormTextFieldWidget(
                    size: size,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  RegisterButtonWidget(
                    size: size,
                    text: 'Create an account',
                  ),
                  InkWell(
                    onTap: () => Get.find<NavigationPageController>()
                        .changeActivePage(PageConstant.LOGIN_PAGE),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: TextStyleGenerator(
                        fontWeight: FontWeight.w300,
                        text: 'Do you have an account? Login',
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
