import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/user_repository.dart';
import 'package:sugandh/config/server/app_server.dart';

import '../../../../core/utils/app_utils.dart';
 

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  // final IAuthRepository repository = AuthRepositoryImpl();

  loginUser() {
    try {
      if (phone.text.isEmpty || password.text.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      repsitory.loginApi(mobile: phone.text, pass: password.text);
   
      //   Get.dialog(buildLoadingIndicator());
      //   final params =
      //       LoginParams(phone: int.tryParse(phone.text), password: password.text);
      //   final response = await repository.loginUser(params);
      //   Get.back();
      //   if (response.data != null) {
      //     // showToastMessage(
      //     //   title: "Success",
      //     //   message: "Login Successful",
      //     // );
      //     LocalStorage.saveToken((response.data?.token)!);
      //     Get.offAll(() => MyDashBoard());
      //   }
    } catch (error) {
      log(error.toString());
    }
  }
}
