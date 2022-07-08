import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:sugandh/views/onboarding/splash/splash_controllers.dart';
import 'package:velocity_x/velocity_x.dart';

 

class SplashScreen extends StatelessWidget {
    SplashScreen({Key? key}) : super(key: key);

    SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // String token = LocalStorage.readToken();
    // log(token);
    // Future.delayed(const Duration(seconds: 2), () {
    //   // if (token.isNotEmpty) {
    //   //   Get.off(MyDashBoard());
    //   // } else {
    //   Get.off(() => const Onbording());
    //   // }
    // });
    return Scaffold(  
      body: Lottie.asset(
        'lib/assets/asset/90016-order-food.json',
      ).centered(),
    );
  }
}
