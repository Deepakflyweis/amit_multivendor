import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/views/user/login/login_screens.dart';
import 'package:sugandh/views/user/signup/signup_controller.dart';
import 'package:sugandh/widgets/app_bar_widget.dart';
import 'package:sugandh/widgets/app_widgets.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  // final SignupController _signupController = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Create Account"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            5.h.heightBox,
            VxTextField(
              labelText: "User Name",
              // controller: _signupController.name,
              borderType: VxTextFieldBorderType.roundLine,
              borderColor: Vx.gray500,
            ).marginAll(10),
            1.h.heightBox,
            VxTextField(
              labelText: "Mobile number",
              // controller: _signupController.mobile,
              borderType: VxTextFieldBorderType.roundLine,
              borderColor: Vx.gray500,
            ).marginAll(10),
            1.h.heightBox,
            VxTextField(
              labelText: "Password",
              // controller: _signupController.password,
              isPassword: true,
              borderType: VxTextFieldBorderType.roundLine,
              borderColor: Vx.gray500,
            ).marginAll(10),
            5.h.heightBox,
            Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Container(
                  height: 52,
                  width: 360,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  // child: Obx(() {
                    // return _signupController.loading.isTrue
                    //     ? buildLoadingIndicator()
                    //     : 'SUBMIT'
                    //         .text
                    //         .size(10.sp)
                    //         .letterSpacing(1.5)
                    //         .bold
                    //         .white
                    //         .make()
                    //         .centered()
                    //         .onTap(() {
                    //         _signupController.registerUser();
                    //       });
                  // }),
                )),
            3.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                6.h.heightBox,
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: buttonColor,
                    ),
                  ),
                ).px8().onTap(() {
                  Get.to(() => LoginScreen());
                }),
              ],
            ),
            5.h.heightBox,
          ],
        ),
      ),
    );
  }
}
