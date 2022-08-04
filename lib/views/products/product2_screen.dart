import 'dart:developer';

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sugandh/controller/cart_controller.dart';
import 'package:sugandh/controller/product_detail_cont.dart';
import 'package:sugandh/controller/products_controller.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class Produt2page extends StatefulWidget {
  Produt2page({Key? key}) : super(key: key);

  @override
  State<Produt2page> createState() => _Produt2pageState();
}

class _Produt2pageState extends State<Produt2page> {
  ProductsController prod = Get.find();
  ProductDetailsController controller = Get.put(ProductDetailsController());
  CartController cartC = Get.put(CartController());

  var isCasionFavt = false;
  final List favouriteLists = [];

  _addFav() {
    controller.callAddWishList(controller.imgId);
    log("added ");
    setState(() {
      isCasionFavt = true;
    });
  }

  _disFavt() {
    controller.callRemoveFav(controller.imgId);
    // prod.romoveFavProducts(controller.imgId);
    log("removed");
    setState(() {
      isCasionFavt = false;
    });
  }

  isCasionFavts() {
    var isCasionFavtLocal = false;
    log(" CasionDetailImage isCasionFavts()");
    for (var element in favouriteLists) {
      if (isCasionFavt) {
        isCasionFavtLocal = true;
        break;
      }
    }

    setState(() {
      isCasionFavt = isCasionFavtLocal;
    });
  }

  List<String> indemand = [
    "lib/assets/asset/indemand1.png",
    "lib/assets/asset/indemand2.png",
    "lib/assets/asset/indemand3.png",
    "lib/assets/asset/indemand4.png",
  ];

  final currtpage = 0.obs;

  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    isCasionFavts();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  buildDot(int index, BuildContext context) {
    return Obx(() {
      return Container(
        height: 10,
        width: currtpage.value == index ? 10 : 10,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currtpage.value == index
              ? const Color(0xFFEEA537)
              : const Color(0xff979797),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: controller.obx(
        (state) =>
         Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 100.w,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: state!.images.length,
                        onPageChanged: (int index) {
                          currtpage.value = index;
                        },
                        itemBuilder: (_, i) {
                          return Image.network(
                            state.images[i].url,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'lib/assets/asset/fullview.png',
                              fit: BoxFit.fill,
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 50.w,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(state.images.length,
                            (index) => buildDot(index, context))),
                  ),
                  // Image.asset(
                  //   'lib/assets/asset/fullview.png',
                  //   fit: BoxFit.fill,
                  // ),
                  Positioned(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      isCasionFavt == true
                          ? IconButton(
                              onPressed: () {
                                _disFavt();
                              },
                              icon: const Icon(Icons.favorite,
                                  color: Colors.redAccent),
                            )
                          : IconButton(
                              onPressed: () => _addFav(),
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                            ),
                    ],
                  ))
                ],
              ),

              2.h.heightBox,
              Row(
                children: [
                  1.w.widthBox,
                  Image.asset("lib/assets/asset/starfill.png"),
                  3.w.widthBox,
                  Text(state.ratings.toString()),
                  3.w.widthBox,
                  const Text("Reviews").text.color(appthemColor).make(),
                ],
              ).pSymmetric(h: 5.w),
              2.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ).pSymmetric(h: 5.w),
              2.h.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Description',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                ).pSymmetric(h: 5.w),
              ),
              1.h.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  state.description,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black),
                ).pSymmetric(h: 5.w),
              ),
              2.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$' + state.price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: appthemColor,
                    ),
                  ),
                  3.w.widthBox,
                  const Text("(include GST 10%)").text.gray700.make(),
                ],
              ).pSymmetric(h: 5.w),
              3.h.heightBox,
              const Text("Select size").pSymmetric(h: 5.w),
              2.5.h.heightBox,
              Row(
                children: [
                  Container(
                    height: 3.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                        color: appthemColor,
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: Center(child: const Text("L").text.white.make()),
                  ),
                  4.w.widthBox,
                  Container(
                    height: 3.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: Center(child: const Text("M").text.gray800.make()),
                  ),
                  4.w.widthBox,
                  Container(
                    height: 3.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.sp)),
                    child: Center(child: const Text("S").text.gray800.make()),
                  )
                ],
              ).pSymmetric(h: 5.w),
              2.h.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: appthemColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ],
                    ).pSymmetric(h: 1.w),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: Container(
                      height: 45,
                      width: 160,
                      decoration: BoxDecoration(
                        border: Border.all(color: appthemColor),
                        //border: Border.all(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: 'ADD TO CART'
                          .text
                          .size(11.sp)
                          .letterSpacing(1.5)
                          .bold
                          .color(appthemColor)
                          .make()
                          .centered(),
                    ).onTap(() {
                      cartC.addCartItem((state.id));
                     
                      // !.then((value) => Get.delete<CartController>());
                    }),
                  ),
                ],
              ).pSymmetric(h: 4.w),
              1.5.h.heightBox,
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: const Text(
              //     'You May Also Like',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //         color: Colors.black),
              //   ).pSymmetric(h: 5.w),
              // ),
              // 1.h.heightBox,
              // SizedBox(
              //   height: 25.5.h,
              //   child: ListView.builder(
              //     // physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (BuildContext, index) {
              //       return Container(
              //         child: Row(
              //           children: [
              //             Container(
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                 color: const Color(0xffE3E6EF),
              //               )),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Stack(
              //                     children: [
              //                       SizedBox(
              //                         height: 15.h,
              //                         width: 42.w,
              //                         child: Image.asset(
              //                           indemand[index],
              //                           //
              //                           height: 10.h,
              //                           width: 40.w,
              //                         ),
              //                       ),
              //                       Positioned(
              //                         left: 10.sp,
              //                         top: 10.sp,
              //                         child: Container(
              //                             height: 2.5.h,
              //                             width: 15.w,
              //                             decoration: BoxDecoration(
              //                               borderRadius:
              //                                   BorderRadius.circular(3.sp),
              //                               color: Colors.white,
              //                             ),
              //                             child: Row(
              //                               children: [
              //                                 1.w.widthBox,
              //                                 Image.asset(
              //                                     "lib/assets/asset/starfill.png"),
              //                                 1.w.widthBox,
              //                                 const Text("4.2+"),
              //                               ],
              //                             )),
              //                       ),
              //                       Positioned(
              //                         left: 100.sp,
              //                         top: 10.sp,
              //                         child: Row(
              //                           children: [
              //                             Image.asset(
              //                               "lib/assets/asset/heart.png",
              //                               height: 1.5.h,
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   1.h.heightBox,
              //                   Text(
              //                     "Men black raglan",
              //                     style: TextStyle(
              //                       fontSize: 9.sp,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ).px(3),
              //                   1.h.heightBox,
              //                   Text(
              //                     "shirt",
              //                     style: TextStyle(
              //                       fontSize: 10.sp,
              //                     ),
              //                   ).px(3),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Text(
              //                         "\$ 565",
              //                         style: TextStyle(
              //                           fontSize: 10.sp,
              //                         ),
              //                       ).px(3),
              //                       22.w.widthBox,
              //                       Image.asset(
              //                         "lib/assets/asset/basket.png",
              //                         color: appthemColor,
              //                       )
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ).pSymmetric(h: 1.w).onTap(() {
              //           // Get.to(() => DiscoverPage());
              //         }),
              //       );
              //     },
              //     itemCount: indemand.length,
              //     shrinkWrap: true,
              //     padding: const EdgeInsets.all(7),
              //     scrollDirection: Axis.horizontal,
              //   ),
              // ),
              // 2.h.heightBox,

              // InkWell(
              //   onTap: () {
              //     Get.to(() => const RateProduct());
              //   },
              //   child: Padding(
              //    padding: const EdgeInsets.only(left: 10.0),
              //     child: Text(
              //      "ADD YOUR COMMENT",
              //       style: TextStyle(
              //        color: appthemColor, fontSize: 15.sp),
              //          ),
              //        ),),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Reviews',
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                ),
              ),
              2.heightBox,
              Container(
                height: 17.h,
                width: 100.w,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: state.reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 25,
                              child: CircleAvatar(
                                backgroundColor: Colors.greenAccent[100],
                                radius: 23,
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'lib/assets/asset/avatar.png'), //NetworkImage
                                  radius: 21,
                                ), //CircleAvatar
                              ), //CircleAvatar
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Ander',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.reviews[index].values.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Spacer(),
                            VxRating(
                              onRatingUpdate: (value) {},
                              count: 5,
                              selectionColor: Colors.yellow,
                              size: 20,
                            ),
                          ]),
                    );
                  },
                ),
              ),
              2.h.heightBox,
            ],
          ),
        ]),
      ))),
    );
  }
}
