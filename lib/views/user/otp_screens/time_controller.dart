import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/config/repository/user_repository.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/views/user/Password/controllers/forget_password_controller.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/views/user/signup/signup_controller.dart';

class OtpTimerController extends GetxController {
  RxString elapsedTime = '02:00'.obs;
  int _start = 120;
  var printOtp;
  // String result = '';
  // final IAuthRepository repository = AuthRepositoryImpl();

  // OtpTimerController({required this.otp, required this.phone});

  String? otpValidator(value) {
    if (value.length == 0) {
      return 'Plese enter otp';
    } else {
      return null;
    }
  }

  checkValidation(var phone) {
    final isValidaton = otpKey.currentState!.validate();

    if (!isValidaton) {
      return;
    } else {
      Get.to(() => MyDashBoard());
      //Get.to(()=>LoginScreen());
      // VerifyotpApi(phone);
    }
  }

  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  // List<TextEditingController> otpList;
  late Timer _timer;
  String otp = "";
  // final String phone;
  String formatTime(int secs) {
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  List<TextEditingController> otpList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  setOTP() {
    otp = "";
    for (var element in otpList) {
      otp = otp + element.text;
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = formatTime(_start);
      }
    });
  }

  final loading = false.obs;

  verifyOtp() {
    try {
      setOTP();
      log("otp $otp");
      // printOtp = otp;
      log("print $printOtp");
      if (otp.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      SignupController controller = Get.find();
      repsitory.registerOtpApi(controller.mobile.text, otp);
    } catch (error) {
      log(error.toString());
    }
  }

  verifyForgetOtp() {
    try {
      setOTP();
      log("otp $otp");
      //  printOtp = otp;
      log("print $printOtp");
      if (otp.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      Client _client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: _client.init());
      ForgetPasswordController controller = Get.find();
      repsitory.forgetVerifyOtpApi(controller.phone.text, otp);
    } catch (error) {
      log(error.toString());
    }
  }

  // verifyOTP(String phone, String otp, bool isForgetPassword) async {
  // try {
  //   if (otp.isEmpty) {
  //     showToastMessage(title: "Error", message: "Fields required");
  //     return;
  //   }
  //   loading.value = true;
  //   VerifyRegistrationParams params =
  //       VerifyRegistrationParams(phone: int.tryParse(phone), otp: otp);
  //   if (isForgetPassword) {
  //     final response = await repository.forgetOtpVerify(params);
  //     loading.value = false;
  //     if (response.data != null) {
  //       showToastMessage(title: "Success", message: "OTP Verified");
  //       Get.off(CreateNewPassword(
  //         token: (response.data?.resetToken)!,
  //       ));
  //     }
  //   } else {
  //     final response = await repository.verifyRegistration(params);
  //     loading.value = false;
  //     if (response.data != null) {
  //       LocalStorage.saveToken((response.data?.token)!);
  //       showToastMessage(title: "Success", message: "OTP Verified");
  //       Get.offAll(MyDashBoard());
  //     }
  //   }
  // } catch (error) {
  //   log(error.toString());
  // }
  // }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
