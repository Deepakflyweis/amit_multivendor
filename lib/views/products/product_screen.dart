import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sugandh/views/products/product2_screen.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:sizer/sizer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE3E6EF),
        title: const Text(
          'Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: const Color(0xFFE3E6EF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 5.h,
                          width: 8.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF9848F),
                            ),
                          ).p2(),
                        ),
                        Container(
                          height: 5.h,
                          width: 8.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ).p2(),
                        ),
                        Container(
                          height: 5.h,
                          width: 8.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF7B91FF),
                            ),
                          ).p2(),
                        ),
                      ],
                    ),
                    Image.asset(
                      'lib/assets/asset/sunglasses.png',
                      height: 20.h,
                      width: 73.7.w,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 6.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFCFCFCF),
                            ),
                            child: const Center(
                              child: Text(
                                'L',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ).p2(),
                        ),
                        Container(
                          height: 6.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: appthemColor,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: appthemColor,
                            ),
                            child: const Center(
                              child: Text(
                                'M',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ).p2(),
                        ),
                        Container(
                          height: 6.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            height: 3.h,
                            width: 3.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFCFCFCF),
                            ),
                            child: const Center(
                              child: Text(
                                'S',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ).p2(),
                        ),
                      ],
                    ),
                  ],
                ).pSymmetric(h: 4.w),
                8.h.heightBox,
                Text(
                  'Sunglasses 1',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ).pSymmetric(h: 4.w),
                2.h.heightBox,
                const Text(
                  '₹ 699',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ).pSymmetric(h: 4.w),
              ],
            ),
          ),
          18.h.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Container(
                  height: 45,
                  width: 160,
                  decoration: BoxDecoration(
                    color: appthemColor,
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                  child: 'View Details'
                      .text
                      .size(12.sp)
                      .letterSpacing(1.5)
                      .bold
                      .white
                      .make()
                      .centered(),
                ).onTap(() {
                  // _signupController.CheckSignup();
                  Get.to(() => Produt2page());
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                }),
              ),
              SizedBox(
                height: 52,
                width: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 52,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      height: 51,
                      width: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appthemColor,
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).pSymmetric(h: 4.w),
          3.h.heightBox,
        ],
      ),
    );
  }
}
