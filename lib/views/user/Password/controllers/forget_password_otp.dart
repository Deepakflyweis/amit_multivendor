import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/views/user/otp_screens/otp_input.dart';
import 'package:sugandh/views/user/otp_screens/time_controller.dart';
import 'package:sugandh/widgets/app_widgets.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetOtp extends StatelessWidget {
  final OtpTimerController _timeController = Get.put(OtpTimerController());
  
  ForgetOtp({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Verification",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            9.h.heightBox,
            Align(
              alignment: Alignment.center,
              child: Text(
                'A 5 Digit PIN has been sent to your',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ).p2(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'phone no. Enter it below to continue',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ).p1(),
            9.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  OtpInput(
                      validator: _timeController.otpValidator,
                      controller: _timeController.otpList[i],
                      autoFocus: i == 0 ? true : false),
              ],
            ),
            10.h.heightBox,
            Container(
                height: 52,
                width: 320,
                decoration: BoxDecoration(
                  color: appthemColor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Obx((() => _timeController.loading.isTrue
                    ? buildLoadingIndicator()
                    : 'VERIFY'
                        .text
                        .size(10.sp)
                        .letterSpacing(1.5)
                        .bold
                        .white
                        .make()
                        .centered()
                        .onInkTap(() {
                        _timeController.verifyForgetOtp();
                        // _timeController.verifyOTP(
                        //     phoneNumber, otp, isForgetPassword
                        //     );
                      })))),
            Obx(() => Text(_timeController.elapsedTime.value)),
            Align(
                    alignment: Alignment.centerRight,
                    child: "Resend OTP".text.black.size(11.sp).end.make())
                .pSymmetric(h: 8.h),
          ],
        ),
      ),
    );
  }
}
