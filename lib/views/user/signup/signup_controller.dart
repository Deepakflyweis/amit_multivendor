import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/user_repository.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/core/utils/app_utils.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> signupform = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  // final IAuthRepository repository = AuthRepositoryImpl();

  // final loading = false.obs;

  registerUser() async {
    // loading.value = true;
    try {
      if (name.text.isEmpty || mobile.text.isEmpty || password.text.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      // RegistrationParams params = RegistrationParams(
      //     name: name.text, phone: mobile.text, password: password.text);
      // final response = await repository.registerUser(params);
      // loading.value = false;
      // if (response.data != null) {

      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      await repsitory.sendRegisterOtp(name.text, mobile.text, password.text);
      showToastMessage(
        title: "Success",
        message: "OTP send to ${mobile.text.toString()}",
      );

      // debugPrint("otp ${response.data?.otp}");
      // Get.to(
      //   OTPScreen(
      //     phoneNumber: mobile.text,
      //     otp: response.data?.otp ?? "",
      //     isForgetPassword: false,
      //   ),
      // );
    } catch (error) {
      // loading.value = false;
      log(error.toString());
    }
  }
}
