import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login/viewmodel/user_viewmodel.dart';
import 'package:login/widgets/textstyle_generator.dart';

class RegisterButtonWidget extends StatelessWidget {
  final String text;
  final Size size;

  RegisterButtonWidget({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserViewModel>(
      builder: (userViewModel) => InkWell(
        onTap: () {
          bool isValid = userViewModel.registerFormKey.currentState!.validate();
          if (isValid) {
            userViewModel.registerFormKey.currentState!.save();
            userViewModel.register(userViewModel.name, userViewModel.email,
                userViewModel.password);
          }
        },
        child: Container(
          height: size.height * .1,
          width: size.width * .94,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(size.height * .1),
            ),
            color: Color.fromRGBO(249, 14, 83, 1),
          ),
          child: Center(
            child: TextStyleGenerator(
              size: 20,
              color: Colors.white,
              text: text,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
