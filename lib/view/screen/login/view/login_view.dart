import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/page_navigation_controller/page_navigation_controller.dart';
import 'package:login/view/screen/login/widget/login_button_widget.dart';
import 'package:login/view/screen/login/widget/page_title_widget.dart';
import 'package:login/view/screen/register/view/register_view.dart';
import 'package:login/viewmodel/user_viewmodel.dart';
import 'package:login/widgets/textfield_login_widget.dart';
import 'package:login/widgets/textstyle_generator.dart';

class LoginViewPage extends StatefulWidget {
  @override
  _LoginViewPageState createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 244, 255, 1),
      body: GetBuilder<UserViewModel>(
        builder: (userViewModelLogin) => Container(
          child: Form(
            key: userViewModelLogin.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageTitleWidget(
                  size: size,
                  text: 'Login',
                ),
                FormTextFieldWidget(
                  size: size,
                  hint: 'Email',
                  isPassword: false,
                ),
                FormTextFieldWidget(
                  hint: 'Password',
                  size: size,
                  isPassword: true,
                ),
                LoginButtonWidget(
                  size: size,
                  text: 'Login',
                ),
                InkWell(
                  onTap: () => Get.off(() => RegisterViewPage()),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: TextStyleGenerator(
                      fontWeight: FontWeight.w300,
                      text: 'Don\'t have an account? Register now',
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
    );
  }
}
