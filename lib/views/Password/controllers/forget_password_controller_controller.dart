import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sugandh/views/otp_screens/otp_page.dart';

import '../../../core/utils/app_utils.dart';
import '../../../data/repoistory/auth_repository_impl.dart';
import '../../../domain/repository/iauth_repository.dart';

class ForgetPasswordController extends GetxController {
  final IAuthRepository repository = AuthRepositoryImpl();
  final loading = false.obs;
  TextEditingController controller = TextEditingController();

  forgetPassword() async {
    if (controller.text.isEmpty) {
      showToastMessage(title: "Error", message: "Fields required");
      return;
    }
    loading.value = true;
    try {
      final response = await repository.forgetPassword(controller.text);
      loading.value = false;
      if (response.data != null) {
        showToastMessage(title: "Success", message: "OTP Send successfully");
        Get.to(OTPScreen(
            phoneNumber: controller.text,
            otp: (response.data?.otp)!,
            isForgetPassword: true));
      }
    } catch (error) {
      log(error.toString());
      loading.value = false;
    }
  }
}
