import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/views/Password/controllers/create_password_controller_controller.dart';
import 'package:sugandh/widgets/welcomeButton_widget.dart';

class CreateNewPassword extends StatelessWidget {
  final String token;
  CreateNewPassword({Key? key, required this.token}) : super(key: key);
  final CreatePasswordController controller = CreatePasswordController();

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
              controller: controller.newcontroller,
              decoration: const InputDecoration(
                hintText: "New Password",
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              controller: controller.confirmcontroller,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(() => controller.loading.isTrue
                ? const LoadingWidget()
                : WelcomeButtonWidget(
                    btnText: "CREATE PASSWORD",
                    ontap: () {
                      controller.changePassword(token);
                    },
                  ))
          ],
        ),
      ),
    );
  }
}
