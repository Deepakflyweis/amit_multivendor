import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sugandh/controller/payment_controller.dart';
import 'package:sugandh/views/check_out_screens/checkout_summary.dart';

class CheckoutPaymentController extends GetxController {
  GlobalKey<FormState> checkpaymentform = GlobalKey();

  TextEditingController card = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController expirydate = TextEditingController();
  TextEditingController cvv = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    card;
    cardnumber;
    expirydate;
    cvv;
  }

  String? validatecard(value) {
    if (value == '') {
      return ' please enter card name';
    }
    return null;
  }

  Checkcard() {
    var isValidate = checkpaymentform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      //Get.to(()=> HomePage());
    }
    checkpaymentform.currentState!.save();
  }

  String? validatecardnumber(value) {
    if (value == '') {
      return ' please enter valid card number';
    }
    return null;
  }

  Checkcardnumber() {
    var isValidate = checkpaymentform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      //Get.to(()=> HomePage());
    }
    checkpaymentform.currentState!.save();
  }

  String? validateexpirydate(value) {
    if (value == '') {
      return ' please enter your expiry date';
    }
    return null;
  }

  Checkexpirydate() {
    var isValidate = checkpaymentform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {}
    checkpaymentform.currentState!.save();
  }

  String? validatecvv(value) {
    if (value == '') {
      return ' please enter valid mobile Country';
    }
    return null;
  }

  Checkcvv() {
    var isValidate = checkpaymentform.currentState!.validate();
    if (!isValidate) {
      PaymentGatewayController controller = Get.find();
      controller.openCheckout();
    }
    // Get.snackbar("Payment", "Successfull");
    // Get.offAll(() => MyDashBoard());

    // else {
        //  Get.off(() => CheckoutSummary());
    //     //callAdduserApi();
    //   }
    //   checkpaymentform.currentState!.save();
  }
// void callAdduserApi() async {
//   http.Response r = await ApiProvider.addUser(name.text,email.text,age.text,mobile.text);
//   if(r.statusCode==200){
//     Get.to(()=> HomePage());
//   }
// }

//here dispose method.............

  @override
  void dispose() {
    checkpaymentform.currentState!.dispose();
    super.dispose();
  }
}
