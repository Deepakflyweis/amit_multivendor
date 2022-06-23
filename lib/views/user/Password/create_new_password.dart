import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_controller.dart';
import 'package:sugandh/widgets/welcomeButton_widget.dart';

class CreateNewPassword extends StatelessWidget {
    
  CreateNewPassword(
    this.resetToken, {
    Key? key,
  }) : super(key: key);
  // final CreatePasswordController controller = CreatePasswordController();
  final ForgetPasswordController _controller = Get.find();
  final String resetToken;

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
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            TextFormField(
              controller: _controller.newPass,
              validator: (value) {
                if (value == "") {
                  return " Please Enter password";
                }
              },
              decoration: const InputDecoration(
                hintText: "New Password",
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              controller: _controller.confirmPass,
              validator: (value) {
                if (value == "") {
                  return " Please Enter password";
                }
              },
              decoration: const InputDecoration(
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            WelcomeButtonWidget(
              btnText: "CREATE PASSWORD",
              ontap: () {
                _controller.setNewPassword(resetToken);
                // controller.changePassword(token);
              },
            )
          ],
        ),
      ),
    );
  }
}
