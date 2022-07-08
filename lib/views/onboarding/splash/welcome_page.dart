import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/views/user/login/login_screens.dart';

import '../../../widgets/welcomeButton_widget.dart';

class WelcomeSplashScreen extends StatefulWidget {
  const WelcomeSplashScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeSplashScreen> createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset("lib/assets/asset/logo.png"),
            ),
            SizedBox(height: 2.h),
            Image.asset("lib/assets/asset/shoping.png"),
            SizedBox(height: 2.h),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2.h),
            const Center(
              child: Text(
                "Sign up to get started and experience\n great shopping deals",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4.h),
            WelcomeButtonWidget(
              btnText: "CONTINUE",
              ontap: () {
                Get.to(LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
