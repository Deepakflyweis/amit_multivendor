import 'package:get/get.dart';

import 'package:sugandh/controller/category_controler.dart';
import 'package:sugandh/views/discover/discover_screens.dart';
import 'package:sugandh/views/search_screen/search_page.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategaryPage extends GetView {
  CategaryPage({Key? key}) : super(key: key);

  final CategoryController _catController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Categary',
            style: TextStyle(
              color: appthemColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ).onTap(() {
            Get.back();
          }),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ).onTap(() {
                Get.to(() => SearchScreen());
              }),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _catController.obx(
            (state) => ListView.builder(
              itemCount: state!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => DiscoverPage());
                  },
                  // onTap: () => Get.to(() => Produt2page(),arguments: state[index].id),
                  child: Card(
                    elevation: 2,
                    child: SizedBox(
                      height: 15.h,
                      width: 90.w,
                      child: Row(
                        children: [
                          Container(
                            height: 13.h,
                            width: 33.w,
                            padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              state[index].image,
                              height: 10.h,
                              width: 25.w,
                              fit: BoxFit.fill,
                              errorBuilder: (context, Object, StackTrace) =>
                                  Center(
                                child: Image.asset(
                                  'lib/assets/asset/kid.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            state[index].name,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
