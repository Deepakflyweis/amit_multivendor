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
  var printOtp3;
  

  registerUser() async { 
    try {
      if (name.text.isEmpty || mobile.text.isEmpty || password.text.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      } 
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      await repsitory.sendRegisterOtp(name.text, mobile.text, password.text);
      showToastMessage(
        title: "Success",
        message: "OTP: ${printOtp3.toString()}",
      ); 
    } catch (error) {
      // loading.value = false;
      log(error.toString());
    }
  }
}
