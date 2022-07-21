import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/user_repository.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/views/user/otp_screens/otp_page.dart';

import '../../../../core/utils/app_utils.dart';

import '../../../../config/repository/iauth_repository.dart';

class ForgetPasswordController extends GetxController {
  // final IAuthRepository repository = AuthRepositoryImpl();
  final loading = false.obs;
  GlobalKey forgetFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  var printOtp2;

  forgetSendOtp() async {
    try {
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      await repsitory.forgetPasswordApi(phone.text);
      showToastMessage(
        title: "Success",
        message: "OTP :  ${printOtp2.toString()}",
      );
    } catch (error) {
      log(error.toString());
    }
  }

  setNewPassword(String resetToken) {
    if (newPass.text != confirmPass.text) {
      showToastMessage(title: "Error", message: "Passwords are not same");
      return;
    }
    try {
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      log("token $resetToken");
      repsitory.setPasswordApi(newPass.text, confirmPass.text, resetToken);
      showToastMessage(title: "Success", message: "Password set successfully");
    } catch (error) {
      log(error.toString());
    }
  }
}
