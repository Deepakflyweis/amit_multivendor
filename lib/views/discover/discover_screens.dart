import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart'; 
import 'package:sugandh/views/discover/all.dart'; 
import 'package:sugandh/views/search_screen/search_page.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class DiscoverPage extends StatelessWidget {
    DiscoverPage({Key? key}) : super(key: key);

  get tabController => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
              'Discover',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                        size: 30.sp,
                      )),
                ]),
                3.h.heightBox,
                SizedBox(
                  height: 30,
                  width: 100.w,
                  child: TabBar(
                    // padding: EdgeInsets.zero,
                    unselectedLabelColor: Colors.grey.shade500,
                    indicatorColor: appthemColor,
                    isScrollable: false,

                    labelColor: Colors.black,

                    labelPadding:
                        const EdgeInsets.only(top: 0, bottom: 3, right: 0),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 't-shirt',
                      ),
                      Tab(
                        text: 'shirt',
                      ),
                      Tab(
                        text: 'jeans',
                      ),
                      Tab(
                        text: 'accessories',
                      ),
                    ],
                  ),
                ),
                  Expanded(
                    child: TabBarView(
                  children:  [
                    Center(
                      child: All(),
                    ),
                    Center(
                      child: All(),
                    ),
                    Center(
                      child: All(),
                    ),
                    Center(
                      child: All(),
                    ),
                    Center(
                      child: All(),
                    ),
                    // Center(
                    //   child: Tshirt(),
                    // ),
                    // Center(
                    //   child: Shirt(),
                    // ),
                    // Center(
                    //   child: Jeans(),
                    // ),
                    // Center(
                    //   child: Accessories(),
                    // ),
                  ],
                )),
              ],
            ),
          )),
    );
  }
}
