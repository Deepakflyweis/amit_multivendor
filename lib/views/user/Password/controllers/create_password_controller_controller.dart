import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/views/onboarding/onboarding.dart';

import '../../../../core/utils/app_utils.dart';
 
import '../../../../domain/params/auth/password_reset_params.dart';
import '../../../../config/repository/iauth_repository.dart';

class CreatePasswordController extends GetxController {
  // final IAuthRepository repository = AuthRepositoryImpl();
  // final loading = false.obs;
  // TextEditingController newcontroller = TextEditingController();
  // TextEditingController confirmcontroller = TextEditingController();

  // changePassword(String token) async {
  //   if (newcontroller.text.isEmpty || confirmcontroller.text.isEmpty) {
  //     showToastMessage(title: "Error", message: "Fields required");
  //     return;
  //   }
  //   if (newcontroller.text != confirmcontroller.text) {
  //     showToastMessage(title: "Error", message: "Passwords are not same");
  //     return;
  //   }

  //   loading.value = true;
  //   try {
  //     PasswordResetParams params = PasswordResetParams(
  //         resetToken: token,
  //         password: newcontroller.text,
  //         confirmPassword: confirmcontroller.text);
  //     final response = await repository.forgetUpdatePassword(params);
  //     loading.value = false;
  //     if (response.data != null) {
  //       showToastMessage(title: "Success", message: "Password updated");
  //       Get.offAll(const Onbording());
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }
}
