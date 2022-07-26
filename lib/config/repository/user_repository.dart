import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/core/utils/common_loader.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_controller.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_otp.dart';
import 'package:sugandh/views/user/Password/create_new_password.dart';
import 'package:sugandh/views/user/login/login_screens.dart';
import 'package:sugandh/views/user/otp_screens/otp_page.dart';
import 'package:sugandh/views/user/signup/signup_controller.dart';

class UserEndPointRepsitory {
  Dio client;
  UserEndPointRepsitory({required this.client});

  final ForgetPasswordController _forgetPasswordController =
      g.Get.put(ForgetPasswordController());

  final SignupController _signupController = g.Get.put(SignupController());

  loginApi({required String mobile, required String pass}) async {
    CommonLoader.showLoading();

    try {
      var data = {"phone": mobile, "password": pass};
      Response response = await client.post("login", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        GetStorage box = GetStorage();
        String token = response.data['token'];
        await box.write("token", token);

        g.Get.offAll(() => MyDashBoard());
        showToastMessage(
          title: "Success",
          message: "Login Successful",
        );
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  /// Register
  sendRegisterOtp(String username, String mobNo, String pass) async {
    CommonLoader.showLoading();
    try {
      var data = {"name": username, "phone": mobNo, "password": pass};
      Response response = await client.post("register", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 201) {
        log("response $response");
        _signupController.printOtp3 = response.data['otp'];
        g.Get.to(() => OTPScreen(
              isLogin: false,
            ));
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  registerOtpApi(String mobNo, String otp) async {
    CommonLoader.showLoading();
    try {
      var data = {"phone": mobNo, "otp": otp};
      Response response = await client.post("verifyRegistration", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 201) {
        GetStorage box = GetStorage();
        String token = response.data['token'];
        await box.write("token", token);
        Client.token = token;
        g.Get.offAll(() => MyDashBoard());
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  forgetPasswordApi(String phoneNo) async {
    CommonLoader.showLoading();
    try {
      var data = {"phone": phoneNo};
      Response response = await client.post("password/forgot", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        log("OTP $response");
        _forgetPasswordController.printOtp2 = response.data['otp']; 
        g.Get.to(() => ForgetOtp(isLogin: false));
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  forgetVerifyOtpApi(String mobile, String otp) async {
    CommonLoader.showLoading();
    try {
      var data = {"phone": mobile, "otp": otp};
      Response response = await client.post("password/verify-otp", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        String resetToken = response.data['resetToken'];
        Client.resettoken = resetToken;
        log("rtoken $resetToken");
        g.Get.to(() => CreateNewPassword(resetToken));
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  setPasswordApi(String pass, String confirmPass, String resetToken) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "resetToken": resetToken,
        "password": pass,
        "confirmPassword": confirmPass
      };
      Response response = await client.post("password/reset/", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        g.Get.offAll(() => LoginScreen());
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
