import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sugandh/controller/cart_controller.dart';
import 'package:sugandh/views/check_out_screens/check_out_address.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController _controller = Get.put(CartController());

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
          'Shopping Cart',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            1.h.heightBox,
            Container(
              padding: EdgeInsets.all(8.sp),
              height: 55.h,
              child: 
              _controller.obx(
              ( state) =>
                  ListView.builder(
                   shrinkWrap: true,
                  itemCount: state!.cart.products.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) { 
                    var url = state.cart.products ;
                    return Padding(
                      padding: EdgeInsets.all(6.sp),
                      child: Container(
                        width: 100.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 28.w,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.network(
                                url[index].product.images[index].url,
                              errorBuilder: (context, error, stackTrace) => 
                                   Center(
                                     child: Image.asset(
                                            'lib/assets/asset/indemand3.png',
                                            fit: BoxFit.fill,
                                          )),
                              )
                               
                            ),
                            3.w.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                1.h.heightBox,
                                Text(
                                  'Men black raglan shirt',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp),
                                ),
                                1.h.heightBox,
                                Text(
                                  '\$565.0',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp),
                                ),
                                2.h.heightBox,
                                Row(
                                  children: [
                                    const Text(""),
                                    30.w.widthBox,
                                    Container(
                                      height: 3.h,
                                      width: 19.w,
                                      decoration: BoxDecoration(
                                        color: appthemColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13),
                                          ),
                                          Icon(Icons.remove,
                                              color: Colors.white, size: 17),
                                        ],
                                      ).p2(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).p8(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Totals',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 19),
              ),
            ).p16(),
            2.h.heightBox,
            Row(
              children: const [
                Text(
                  'Sub Total',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                Text(
                  '   ............................'
                  '..................'
                  '...................  ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                Text(
                  '₹699.00',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ).pSymmetric(h: 4.w),
            3.h.heightBox,
            Row(
              children: const [
                Text(
                  'Sub Total',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                Text(
                  '  ....................................'
                  '.........................'
                  '...................',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                Text(
                  '₹0',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ).pSymmetric(h: 4.w),
            5.h.heightBox,
            Container(
              height: 6.h,
              width: 92.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    width: 49.w,
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.start,
                        //controller: someTextXontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter Voucher Code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "APPLY",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ).px16(),
            ),
            8.h.heightBox,
            Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Container(
                height: 52,
                width: 180,
                decoration: BoxDecoration(
                  color: appthemColor,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: 'CHECKOUT'
                    .text
                    .size(10.sp)
                    .letterSpacing(1.5)
                    .bold
                    .white
                    .make()
                    .centered(),
              ).onTap(() {
                //_signupController.CheckSignup();
                Get.to(() => CheckoutAddress());
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
              }),
            ),
            1.h.heightBox,
          ],
        ),
      ),
    );
  }
}
