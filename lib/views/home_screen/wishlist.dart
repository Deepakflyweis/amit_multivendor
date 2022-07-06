import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:sugandh/controller/wishlist_controller.dart';
import 'package:sugandh/views/products/product2_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  WishListController _controller = Get.put(WishListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 15,
            )),
        title: const Text(
          'WishList',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 100.h,
            child: _controller.obx(
              (state) => GridView.builder(
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 215,
                  ),
                  itemCount: state!.wishlist.products.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () => Get.to(() => Produt2page(),
                          arguments: state.wishlist.products[index].id),
                      child: Container(
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 0.8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 8, 0, 0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.wishlist.products[index].name,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40.w,
                                height: 15.h,
                                child: Image.network(
                                   state.wishlist.products[index].images[index].url,
                                  fit: BoxFit.fill,
                                errorBuilder:(context, error, stackTrace) => const Center(
                                  child:  Text(" No Image")
                                ),
                                )
                                
                              ),
                              Container(
                                height: 8.h,
                                color: Color(0xFFE3E6EF),
                                width: 45.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "₹" +
                                                state.wishlist.products[index]
                                                    .price
                                                    .toString(),
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        const Text(
                                          'Buy Now',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.shopping_bag,
                                          // color: appthemColor,
                                          size: 20.0,
                                        ),
                                        2.h.heightBox,
                                        const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ).pSymmetric(h: 3.w),
                              ),
                            ],
                          )).pSymmetric(h: 2.w),
                    );
                  }),
            ),
          )
        ]),
      ),
    );
  }
}
