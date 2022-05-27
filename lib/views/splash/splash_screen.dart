import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/datasources/local/local_database.dart';
import '../buttom_nav_bar/dash_bord.dart';
import '../onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  static String route = '/splase-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = LocalStorage.readToken();
    log(token);
    Future.delayed(const Duration(seconds: 2), () {
      if (token.isNotEmpty) {
        Get.off(MyDashBoard());
      } else {
        Get.off(const Onbording());
      }
    });
    return Scaffold(
      body: Lottie.asset(
        'lib/assets/asset/90016-order-food.json',
      ).centered(),
    );
  }
}
