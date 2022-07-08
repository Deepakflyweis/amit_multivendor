import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/controller/products_controller.dart';
import 'package:sugandh/views/products/product2_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class All extends GetView {
    All({Key? key}) : super(key: key);

  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: controller.obx((state) => 
         GridView.builder(             
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 2,
             mainAxisSpacing: 20,
             mainAxisExtent: 205,
            ),
            itemCount: state!.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            color: const Color(0xffE3E6EF),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 15.h,
                                width: 39.w,
                                child: Image.network(
                                  state[index].images[0].url,
                                fit: BoxFit.fill,
                                errorBuilder:(context, error, stackTrace) => 
                                 Image.asset(
                                  "lib/assets/asset/indemand1.png",                                 
                                  fit: BoxFit.fill,
                                ),
                                )
                               
                              ),
                        Positioned(
                                left: 0,
                                top: 5,
                                child: Container(
                                    height: 2.5.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.sp),
                                      color: Colors.transparent,
                                    ),
                                    child: Row(
                                      children: [
                                        1.w.widthBox,
                                        Image.asset(
                                            "lib/assets/asset/starfill.png"),
                                        1.w.widthBox,
                                          Text(state[index].ratings.toString()),
                                      ],
                                    )),
                              ),
                              Positioned(                              
                                right: 10 ,
                                top: 10,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/asset/heart.png",
                                      height: 1.5.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          1.h.heightBox,
                          Text(
                            state[index].name,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ).px(3),
                          1.h.heightBox,
                          Text(
                            state[index].description,
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ).px(3),
                          1.h.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "\$ " + state[index].price.toString(),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ).px(3),
                              22.w.widthBox,
                              Image.asset("lib/assets/asset/basket.png")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ).pSymmetric(h: 1.w).onTap(() {
                  Get.to(() => Produt2page(),arguments: state[index].id);
                }),
              ).pSymmetric(h: 2.w);
            }),
      
      ),),
    );
  }
}
