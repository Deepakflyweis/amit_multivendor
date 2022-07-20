import 'package:get/get.dart';
import 'package:sugandh/controller/payment_controller.dart';
import 'package:sugandh/widgets/constant.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:circle_checkbox/redev_checkbox.dart';

import 'checkbox_controller.dart';
import 'checkout_address_controller.dart';

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({Key? key}) : super(key: key);

  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  final Checkbox1 _checkbox1 = Get.put(Checkbox1());

  final CheckoutAddressController _checkoutAddressController =
      Get.put(CheckoutAddressController());
  PaymentGatewayController paymentController =
      Get.put(PaymentGatewayController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 19, color: appthemColor),
        ),
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 22,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _checkoutAddressController.checkAddressform,
            child: Column(
              children: [
                3.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 2,
                      shape: BoxShape.circle,
                      child: Container(
                        height: 3.h,
                        width: 6.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 3.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            color: appthemColor,
                            shape: BoxShape.circle,
                          ),
                        ).p4(),
                      ),
                    ),
                    Container(
                      height: 0.2.h,
                      width: 36.w,
                      color: Colors.black,
                    ),
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 2,
                      shape: BoxShape.circle,
                      child: Container(
                        height: 3.h,
                        width: 6.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 3.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ).p4(),
                      ),
                    ),
                    Container(
                      height: 0.2.h,
                      width: 36.w,
                      color: Colors.black,
                    ),
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 2,
                      shape: BoxShape.circle,
                      child: Container(
                        height: 3.h,
                        width: 6.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 3.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ).p4(),
                      ),
                    ),
                  ],
                ).pSymmetric(h: 4.w),
                2.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Address',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Payment',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Summary',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ).pSymmetric(h: 4.w),
                2.h.heightBox,
                Obx(
                  () => CircleCheckboxListTile(
                    activeColor: appthemColor,
                    title: const Text(
                      'Billing address is the same as delivery',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _checkbox1.value1.value,
                    onChanged: _checkbox1.value1,
                    //secondary: const Icon(Icons.hourglass_empty),
                  ),
                ),
                1.h.heightBox,

                ///Street
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Street',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )).pSymmetric(h: 4.w),
                TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return ' please enter street';
                    }
                    return null;
                  },
                  controller: _checkoutAddressController.street,
                  decoration: const InputDecoration(
                    hintText: 'Street no',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                ).pSymmetric(h: 4.w),
                3.h.heightBox,
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Locality/Landmark',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )).pSymmetric(h: 4.w),
                TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return ' please enter Locality';
                    }
                    return null;
                  },
                  controller: _checkoutAddressController.locality,
                  decoration: const InputDecoration(
                    hintText: 'M.G Road',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                ).pSymmetric(h: 4.w),
                3.h.heightBox,
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PinCode',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )).pSymmetric(h: 4.w),
                TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return ' please enter pincode';
                    }
                    return null;
                  },
                  controller: _checkoutAddressController.pincode,
                  decoration: const InputDecoration(
                    hintText: 'pincode',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                  ),
                ).pSymmetric(h: 4.w),
                3.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'City',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'State',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )).pSymmetric(h: 34.w),
                  ],
                ).pSymmetric(h: 4.w),
                Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return ' please enter your city';
                          }
                          return null;
                        },
                        controller: _checkoutAddressController.city,
                        decoration: const InputDecoration(
                          hintText: 'noida',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                      ).pSymmetric(h: 4.w),
                    ),
                    SizedBox(
                      width: 50.w,
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return ' please enter your state';
                          }
                          return null;
                        },
                        controller: _checkoutAddressController.state,
                        decoration: const InputDecoration(
                          hintText: 'U.P',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                        ),
                      ).pSymmetric(h: 4.w),
                    ),
                  ],
                ),
                5.h.heightBox,
                Center(
                  child: Container(
                    height: 52,
                    width: 170,
                    decoration: BoxDecoration(
                      color: appthemColor,
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    child: 'NEXT'
                        .text
                        .size(10.sp)
                        .letterSpacing(1.5)
                        .bold
                        .white
                        .make()
                        .centered(),
                  ).onTap(() {
                    _checkoutAddressController.checkoutAddressApi();
                    //Get.to(()=> CheckOutPayment());
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                  }),
                ).pSymmetric(h: 4.w),
                1.h.heightBox,
                0.5.h.heightBox,
                0.5.h.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
