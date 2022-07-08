import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:sugandh/views/onboarding/intro.dart';
import 'package:sugandh/views/user/signup/create_account.dart';
import 'package:sugandh/views/user/signup/sign_up.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currtpage = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currtpage = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          contents[i].image!,
                        ),
                        Text(
                          contents[i].title!,
                          style: const TextStyle(
                              color: Color(0xff010F07),
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          contents[i].discription!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xff868686), fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ).box.height(65.h).make(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => buildDot(index, context))),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
          Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: appthemColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      topRight: Radius.circular(10.sp))),
              child: Column(
                children: [
                  2.h.heightBox,
                  const Text("--- Connect With ---")
                      .text
                      .white
                      .size(12.sp)
                      .bold
                      .make(),
                  2.h.heightBox,
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Container(
                      height: 6.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'lib/assets/asset/Icon_Facebook.png',
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign in with facebook',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Vx.black,
                              ),
                            ),
                          ).pOnly(right: 24.w),
                        ],
                      ).pSymmetric(h: 9.w),
                    ).onTap(() {
                      //_loginController.CheckLogin();
                      //Get.to(()=> LoginScreen());
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Container(
                      height: 6.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'lib/assets/asset/icons8_Google_2.png',
                            height: 20,
                          ),
                          6.h.heightBox,
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign in with gmail',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Vx.black,
                              ),
                            ),
                          ).pOnly(right: 24.w),
                        ],
                      ).pSymmetric(h: 9.w),
                    ).onTap(() {
                      //_loginController.CheckLogin();
                      //Get.to(()=> LoginScreen());
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Do not have an account?',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      6.h.heightBox,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ).px8().onTap(() {
                        // Get.to(() => SignUpScreen());
                        Get.to(() => CreateAccount());
                      }),
                    ],
                  ),
                ],
              )).positioned(bottom: 0, left: 0, right: 0),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currtpage == index ? 10 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currtpage == index ? appthemColor : const Color(0xff979797),
      ),
    );
  }
}
