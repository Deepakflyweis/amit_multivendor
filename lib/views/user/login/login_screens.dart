import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/views/user/Password/forget_password.dart';
import 'package:sugandh/widgets/app_bar_widget.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:sugandh/widgets/welcomeButton_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Login"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            3.h.heightBox,
            Center(
              child: Container(
                height: 10.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: appthemColor,
                    borderRadius: BorderRadius.circular(30.sp)),
                child: Center(child: const Text("Logo").text.white.make()),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  height: 2.h,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: buttonColor,
                    ),
                  ),
                ).p2(),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Login in to get started and experience',
                    style: TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ).p2(),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Great shoping deals',
                    style: TextStyle(
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ).p1(),
                2.h.heightBox,
                TextFormField(
                  controller: _loginController.phone,
                  decoration: const InputDecoration(
                    hintText: 'Mobile No',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: appthemColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appthemColor, width: 0.5),
                    ),
                  ),
                ).pSymmetric(h: 4.w),
                TextFormField(
                  obscureText: true,
                  controller: _loginController.password,
                  decoration: const InputDecoration(
                    hintText: 'password',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: appthemColor,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: appthemColor, width: 0.5),
                    ),
                  ),
                ).pSymmetric(h: 4.w),
                InkWell(
                  onTap: () {
                    Get.to(ForgetPassword());
                  },
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(color: Vx.gray500),
                  ).pSymmetric(h: 4.w, v: 2.h),
                ),
                5.h.heightBox,
                WelcomeButtonWidget(
                  btnText: "SIGN IN",
                  ontap: () {
                    _loginController.loginUser();
                  },
                ).centered(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
