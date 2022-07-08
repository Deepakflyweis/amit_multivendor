import 'package:get/get.dart';

import 'package:sugandh/controller/products_controller.dart';
import 'package:sugandh/views/category/catagary_screen.dart';
import 'package:sugandh/views/discover/discover_screens.dart';
import 'package:sugandh/views/products/product2_screen.dart';
import 'package:sugandh/views/search_screen/search_page.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:sugandh/widgets/drower_box.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    List<String> baner1 = [
      "lib/assets/asset/slide-1.png",
      "lib/assets/asset/slide2.png",
      "lib/assets/asset/slide3.png",
    ];

    List<String> baner2 = [
      "lib/assets/asset/shoeshop.png",
      "lib/assets/asset/menshop.png",
      "lib/assets/asset/womenshop.png",
      "lib/assets/asset/kidshop.png",
      "lib/assets/asset/mobileshop.png",
    ];
    List<String> indemand = [
      "lib/assets/asset/indemand1.png",
      "lib/assets/asset/indemand2.png",
      "lib/assets/asset/indemand3.png",
      "lib/assets/asset/indemand4.png",
    ];

    List<String> banner2text1 = [
      'Sale',
      'Men',
      'Women',
      'kids',
      'Mobiles',
    ];

    int pageIndex = 0;

    GlobalKey<ScaffoldState> _key = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
            backgroundColor: Vx.white,
            elevation: 0,
            leading: const Icon(
              Icons.menu,
              color: Vx.black,
            ).onTap(() {
              debugPrint("ml");
              _key.currentState!.openDrawer();
            }),
            title: "Home".text.gray600.makeCentered(),
            actions: [
              const Icon(
                Icons.notifications_outlined,
                color: Vx.white,
                size: 16,
              )
                  .pOnly(left: 5, right: 5)
                  .box
                  .red500
                  .rounded
                  .margin(const EdgeInsets.all(15))
                  .make()
            ]),
        drawer: const OpenDrawer(),
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(color: Colors.white
              //gradient: gradient2,
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                2.h.heightBox,
                Row(children: [
                  InkWell(
                    onTap: () => Get.to(() => SearchScreen()),
                    child: Container(
                      height: 5.4.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffE3E6EF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          hintText: 'Search products',
                          hintStyle:
                              TextStyle(fontSize: 12.sp, color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 2.w),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  5.w.widthBox,
                //   IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.filter_alt_outlined,
                //         color: Colors.grey,
                //         size: 30.sp,
                //       )),
                  ]).p12(),
                Container(
                  height: 22.h,
                  width: 100.w,
                  color: Colors.white,
                  child: ListView.builder(
                    //physics: NeverScrollableScrollPhysics(),

                    itemBuilder: (BuildContext, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  height: 22.h,
                                  width: 100.w,
                                  child: Image.asset(
                                    baner1[index],
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ),
                        ],
                      );
                    },
                    itemCount: baner1.length,
                    shrinkWrap: true,
                    //padding: EdgeInsets.all(5),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  height: 55,
                  width: 416,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shop by Category',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => CategaryPage()),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: appthemColor,
                          ),
                        ),
                      ),
                    ],
                  ).pSymmetric(v: 0.5.h, h: 3.3.w),
                ),
                SizedBox(
                  height: 14.5.h,
                  width: 100.w,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: (34),
                                backgroundColor: const Color(0xffE3E6EF),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    baner2[index],
                                    height: 5.h,
                                    width: 100.w,
                                  ),
                                ),
                              ),
                              1.h.heightBox,
                              Text(
                                banner2text1[index],
                                style: const TextStyle(color: appthemColor),
                              )
                            ],
                          )
                        ],
                      ).pSymmetric(h: 1.w).onTap(() {
                        Get.to(() => DiscoverPage());
                      });
                    },
                    itemCount: baner2.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(7),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Container(
                  height: 55,
                  width: 416,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'In Demand',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => DiscoverPage()),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: appthemColor,
                          ),
                        ),
                      ),
                    ],
                  ).pSymmetric(v: 0.5.h, h: 3.3.w),
                ),

                /// in demand products
                controller.obx(
                  (state) => SizedBox(
                    height: 25.5.h,
                    child: ListView.builder(
                      itemCount: state!.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(7),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
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
                                            width: 42.w,
                                            child: Image.network(
                                              state[index].images[0].url,
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                indemand[index],
                                                height: 10.h,
                                                width: 40.w,
                                              ),
                                            )),
                                        Positioned(
                                          left: 10.sp,
                                          top: 10.sp,
                                          child: Container(
                                              height: 2.5.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.sp),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  1.w.widthBox,
                                                  Image.asset(
                                                      "lib/assets/asset/starfill.png"),
                                                  1.w.widthBox,
                                                  Text(state[index]
                                                      .ratings
                                                      .toString()),
                                                ],
                                              )),
                                        ),
                                        Positioned(
                                          left: 100.sp,
                                          top: 10.sp,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$ " + state[index].price.toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ).px(3),
                                        22.w.widthBox,
                                        Image.asset(
                                            "lib/assets/asset/basket.png")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).pSymmetric(h: 1.w).onTap(() {
                            Get.to(() => Produt2page(),
                                arguments: state[index].id);
                          }),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 416,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => DiscoverPage()),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: appthemColor,
                          ),
                        ),
                      ),
                    ],
                  ).pSymmetric(v: 0.5.h, h: 3.3.w),
                ),
                SizedBox(
                  height: 25.5.h,
                  child: controller.obx(
                    (state) => ListView.builder(
                      itemCount: state!.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(7),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
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
                                            width: 42.w,
                                            child: Image.network(
                                              state[index].images[0].url,
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                indemand[index],
                                                height: 10.h,
                                                width: 40.w,
                                              ),
                                            )),
                                        Positioned(
                                          left: 10.sp,
                                          top: 10.sp,
                                          child: Container(
                                              height: 2.5.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.sp),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  1.w.widthBox,
                                                  Image.asset(
                                                      "lib/assets/asset/starfill.png"),
                                                  1.w.widthBox,
                                                  Text(state[index]
                                                      .ratings
                                                      .toString()),
                                                ],
                                              )),
                                        ),
                                        Positioned(
                                          left: 100.sp,
                                          top: 10.sp,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$ " + state[index].price.toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ).px(3),
                                        22.w.widthBox,
                                        Image.asset(
                                            "lib/assets/asset/basket.png")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).pSymmetric(h: 1.w).onTap(() {
                            Get.to(() => Produt2page(),
                                arguments: state[index].id);
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
