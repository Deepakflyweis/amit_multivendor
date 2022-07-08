import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:sugandh/controller/search_cont.dart';
import 'package:sugandh/views/products/product2_screen.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView {
  SearchScreen({Key? key}) : super(key: key);

  final SearchController _controller = Get.put(SearchController());
   bool isVisibleItems = false;

  List<String> baner11 = [
    "lib/assets/asset/all.png",
    "lib/assets/asset/all.png",
    "lib/assets/asset/all.png",
  ];

  List<String> banner11text1 = [
    'All',
    'Man',
    'Women',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 4.8.h,
            width: 80.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: _controller.value1,
              onSubmitted: (value) => _controller.callSearchApi(),              
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
                hintText: 'Search..',
                hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              )),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
          children: [
            2.h.heightBox,
            // Container(
            //   height: 21.h,
            //   width: 100.w,
            //   color: Colors.white,
            //   child: ListView.builder(
            //     // physics: NeverScrollableScrollPhysics(),

            //     itemBuilder: (BuildContext, index) {
            //       return Column(
            //         children: [
            //           1.h.heightBox,

            //           SizedBox(
            //             height: 20.h,
            //             width: 34.w,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Container(
            //                   height: 16.h,
            //                   width: 32.w,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(20),
            //                     border: Border.all(color: Colors.grey),
            //                   ),

            //                   child: Image.asset(
            //                     baner11[index],
            //                     fit: BoxFit.fill,
            //                   ),
            //                   //Image.asset(baner1[index],fit: BoxFit.fill,)),
            //                 ),
            //                 Text(
            //                   banner11text1[index],
            //                   style: const TextStyle(
            //                       fontSize: 15,
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ).pSymmetric(h: 1.w),
            //           )

            //           //Image.asset('lib/assets/asset/sale1.png',fit: BoxFit.fill,)),
            //           //AssetImage(images[index]),
            //           //Text("This is title",style: TextStyle(fontSize: 10,),),
            //         ],
            //       ).paddingSymmetric(horizontal: 2.w);
            //     },
            //     itemCount: 3,
            //     shrinkWrap: true,
            //     //padding: EdgeInsets.all(2),
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            // const Divider(
            //   color: Colors.grey,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ' ',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 5.w),
            2.h.heightBox,

            _controller.obx(               
             (state) =>  Container(
              height: 73.h,
              width: 100.w,
              color: Colors.white,
              child:
            //  _controller.isLoading.value
              
            //  ?  const Text("No result found!",
            //    style:  TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //  )
            //   :
               ListView.builder(
                itemCount: state!.length,
                shrinkWrap: true,
                controller: _controller.scrollController,
                itemBuilder: (BuildContext, index) {
                  return InkWell(
                    onTap: () => Get.to(() => Produt2page(),arguments: state[index].id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            1.h.heightBox,
                              
                            SizedBox(
                              height: 16.h,
                              width: 100.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 16.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Image.network(
                                        state[index].images[0].url,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'lib/assets/asset/bg.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Text(
                                        state[index].name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                        Text(
                                         state[index].description,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      3.h.heightBox,
                                      SizedBox(
                                        height: 5.h,
                                        width: 16.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Icon(
                                              Icons.shopping_bag,
                                              color: appthemColor,
                                              size: 22,
                                            ),
                                            Icon(Icons.favorite_outline_rounded,
                                                color: Colors.black, size: 22),
                                          ],
                                          //Icon(Icons.shopping_bag)
                                        ),
                                      ),
                                    ],
                                  ),
                                  4.w.widthBox,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text(
                                        "\$ " + state[index].price.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: appthemColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ).pSymmetric(h: 5.w),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
