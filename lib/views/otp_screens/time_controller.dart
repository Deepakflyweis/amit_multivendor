import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/core/utils/app_utils.dart';
import 'package:sugandh/data/datasources/local/local_database.dart';
import 'package:sugandh/views/Password/create_new_password.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import '../../data/repoistory/auth_repository_impl.dart';
import '../../domain/params/auth/verify_registration_params.dart';
import '../../domain/repository/iauth_repository.dart';

class OtpTimerController extends GetxController {
  RxString elapsedTime = '02:00'.obs;
  int _start = 120;
  String result = '';
  final IAuthRepository repository = AuthRepositoryImpl();

  OtpTimerController({required this.otp, required this.phone});

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
  late List<TextEditingController> otpList;
  late Timer _timer;
  final String otp;
  final String phone;
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

  initList() {
    otpList = [
      TextEditingController(text: otp.characters.elementAt(0)),
      TextEditingController(text: otp.characters.elementAt(1)),
      TextEditingController(text: otp.characters.elementAt(2)),
      TextEditingController(text: otp.characters.elementAt(3)),
      TextEditingController(text: otp.characters.elementAt(4)),
    ];
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
  verifyOTP(String phone, String otp, bool isForgetPassword) async {
    try {
      if (otp.isEmpty) {
        showToastMessage(title: "Error", message: "Fields required");
        return;
      }
      loading.value = true;
      VerifyRegistrationParams params =
          VerifyRegistrationParams(phone: int.tryParse(phone), otp: otp);
      if (isForgetPassword) {
        final response = await repository.forgetOtpVerify(params);
        loading.value = false;
        if (response.data != null) {
          showToastMessage(title: "Success", message: "OTP Verified");
          Get.off(CreateNewPassword(
            token: (response.data?.resetToken)!,
          ));
        }
      } else {
        final response = await repository.verifyRegistration(params);
        loading.value = false;
        if (response.data != null) {
          LocalStorage.saveToken((response.data?.token)!);
          showToastMessage(title: "Success", message: "OTP Verified");
          Get.offAll(MyDashBoard());
        }
      }
    } catch (error) {
      log(error.toString());
    }
  }

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
