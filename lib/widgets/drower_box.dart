import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; 
import 'package:sizer/sizer.dart'; 
import 'package:sugandh/controller/profile_controller.dart';
import 'package:sugandh/views/buttom_nav_bar/dash_bord.dart';
import 'package:sugandh/views/category/catagary_screen.dart'; 
import 'package:sugandh/views/discover/discover_screens.dart';
import 'package:sugandh/views/home_screen/wishlist.dart';
import 'package:sugandh/views/user/login/login_screens.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class OpenDrawer extends StatefulWidget {
  const OpenDrawer({Key? key}) : super(key: key);

  @override
  _OpenDrawerState createState() => _OpenDrawerState();
}

class _OpenDrawerState extends State<OpenDrawer> {
  ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      child: Drawer(
        backgroundColor: appthemColor,
        child: SafeArea(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Column(
              children: [
                _controller.obx(
                  (state) => Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        2.h.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 50,
                            child: ClipOval(
                              child: Image.network(
                                state!.profile.toString(),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'lib/assets/asset/avatar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ), //CircleAvatar
                          ),
                        ).px32(),
                        1.h.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.name.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ).px32(),
                        1.h.heightBox,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            state.email.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ).px32(),
                      ],
                    ),
                  ),
                ),
                2.h.heightBox,
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListView(
                      padding: const EdgeInsets.all(0.0),
                      children: [
                        ListTile(
                          onTap: () {
                            Get.to(() => MyDashBoard());
                          },
                          leading: Image.asset(
                            'lib/assets/asset/home.png',
                            height: 17,
                            width: 55,
                          ),
                          //Icon(FontAwesomeIcons.calendarCheck,color: Colors.black,),
                          title: const Text(
                            'Home',
                            style: TextStyle(color: Colors.black),
                          ),
                          //PersonalDetails
                        ),

                        // Container(
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //       'lib/assets/asset/Icon_Catalog.png',
                        //       height: 17,
                        //       width: 55,
                        //     ),
                        //     //Icon(Icons.supervised_user_circle,color: Colors.black,),
                        //     title: Text(
                        //       'Catalog',
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //     //PersonalDetails
                        //   ),
                        // ).onTap(() {
                        //   Get.to(() => DiscoverPage());

                        //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
                        // }),

                        Container(
                          child: ListTile(
                            leading: Image.asset(
                              'lib/assets/asset/category.png',
                              height: 17,
                              width: 55,
                            ),
                            //Icon(Icons.supervised_user_circle,color: Colors.black,),
                            title: Text(
                              'Categary',
                              style: TextStyle(color: Colors.black),
                            ),
                            //PersonalDetails
                          ),
                        ).onTap(() {
                          Get.to(() => CategaryPage());

                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleFit()));
                        }),
                        Container(
                          child: ListTile(
                            leading: Image.asset(
                              'lib/assets/asset/Icon_Collection.png',
                              height: 17,
                              width: 55,
                            ),
                            //Icon(Icons.supervised_user_circle,color: Colors.black,),
                            title: const Text(
                              'Collection',
                              style: TextStyle(color: Colors.black),
                            ),
                            //PersonalDetails
                          ),
                        ).onTap(() {
                           Get.to(() => DiscoverPage());

                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserComments()));
                        }),
                        // Container(
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //       'lib/assets/asset/IconProduct.png',
                        //       height: 17,
                        //       width: 55,
                        //     ),
                        //     //Icon(Icons.supervised_user_circle,color: Colors.black,),
                        //     title: Text(
                        //       'Product',
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //     //PersonalDetails
                        //   ),
                        // ).onTap(() {
                        //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyReports()));
                        // }),
                        Container(
                          child: ListTile(
                            leading: Image.asset(
                              'lib/assets/asset/heart.png',
                              height: 17,
                              width: 55,
                              color: Colors.red,
                            ),
                            //Icon(Icons.supervised_user_circle,color: Colors.black,),
                            title: const Text(
                              'Wishlist',
                              style: TextStyle(color: Colors.black),
                            ),
                            //PersonalDetails
                          ),
                        ).onTap(() {
                          Get.to(() => WishListScreen());
                        }), //ShrareDetails

                        Container(
                          child: const ListTile(
                            leading: Icon(
                              Icons.account_box_outlined,
                              size: 20,
                            ),
                            //Icon(Icons.supervised_user_circle,color: Colors.black,),
                            title: Text(
                              'Aboutus',
                              style: TextStyle(color: Colors.black),
                            ),
                            //PersonalDetails
                          ),
                        ).px16().onTap(() {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppointment()));
                        }),

                        const ListTile(
                          leading: Icon(
                            Icons.logout,
                            size: 20,
                          ),
                          //Icon(Icons.supervised_user_circle,color: Colors.black,),
                          title: Text(
                            'Logout',
                            style: TextStyle(color: Colors.black),
                          ),
                          //PersonalDetails
                        ).px16().onTap(() {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppointment()));
                          _logoutBottomSheet(context);
                        }),
                      ],
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

  void _logoutBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            child: Image.asset("lib/assets/asset/cancel.png")))
                  ],
                ),
                3.h.heightBox,
                Text(
                  "Are you sure you want to\nlogout?",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                ),
                3.h.heightBox,
                InkWell(
                  onTap: () {
                    GetStorage box = GetStorage();
                    box.erase();
                    Get.offAll(() => LoginScreen());
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                        color: appthemColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "YES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
