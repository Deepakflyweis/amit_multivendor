import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/widgets/app_widgets.dart';

import '../../../core/utils/app_utils.dart';
import '../../../data/datasources/local/local_database.dart';
import '../../../data/repoistory/auth_repository_impl.dart';
import '../../../domain/params/auth/login_params.dart';
import '../../../domain/repository/iauth_repository.dart';

class LoginController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  final IAuthRepository repository = AuthRepositoryImpl();

  loginUser() async {
    try {
      if (phone.text.isEmpty || password.text.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      Get.dialog(buildLoadingIndicator());
      final params =
          LoginParams(phone: int.tryParse(phone.text), password: password.text);
      final response = await repository.loginUser(params);
      Get.back();
      if (response.data != null) {
        showToastMessage(
          title: "Success",
          message: "Login Successful",
        );
        LocalStorage.saveToken((response.data?.token)!);
        Get.offAll(MyDashBoard());
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
