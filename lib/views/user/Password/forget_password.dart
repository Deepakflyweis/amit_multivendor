import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_controller.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_otp.dart';
import 'package:sugandh/widgets/welcomeButton_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final ForgetPasswordController _forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Forget Password ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: _forgetPasswordController.forgetFormKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Center(
                  child: Text(
                "Enter Your Mobile Number to get the \n verification code",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, color: Vx.gray600),
              )),
              SizedBox(
                height: 5.h,
              ),
              TextFormField(
                controller: _forgetPasswordController.phone,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == "") {
                    return "Phone Number is empty.";
                  } 
                },
                decoration: const InputDecoration(
                  hintText: "Mobile No",
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              WelcomeButtonWidget(
                btnText: "Next",
                ontap: () {
                  _forgetPasswordController.forgetSendOtp();
                  
                  // Get.to(() => ForgetOtp(isLogin: false));
                  // controller.forgetPassword();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
