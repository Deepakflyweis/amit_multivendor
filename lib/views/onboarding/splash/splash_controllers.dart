import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sugandh/config/server/app_server.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/views/onboarding/onboarding.dart';
import 'package:sugandh/views/user/login/login_screens.dart';
 

class SplashController extends GetxController{

   @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      checkLogin();
    });
    super.onInit();
  }

  checkLogin() async {
    GetStorage box = GetStorage();
    try {
      String? token = box.read("token");
      if (token != null) {
        Client.token = token;    
        Get.off(() => MyDashBoard());         
      } else {
       Get.off(() => const Onbording());
      }
    } on Exception catch (e) {
      Get.off(() => LoginScreen());
    }
  }
}